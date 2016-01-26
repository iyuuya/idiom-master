class FourPhrase < ApplicationRecord
  attr_accessor :value

  belongs_to :char1, class_name: 'Character'
  belongs_to :char2, class_name: 'Character'
  belongs_to :char3, class_name: 'Character'
  belongs_to :char4, class_name: 'Character'

  validates :char1_id, uniqueness: { scope: [:char2_id, :char3_id, :char4_id], message: I18n.t('activerecord.errors.exists') }

  validates :value, length: { is: 4 }
  validate :presence_all_chars

  before_save do
    %i(char1 char2 char3 char4).each do |column|
      errors.details.delete(column)
    end
  end

  scope :from_string, -> (string, op='or') {
    op = 'or' if op != 'or' and op != 'and'
    char_ids = Character.where(char: string.chars).ids
    if op == 'or'
      where("char1_id in (?) or char2_id in (?) or char3_id in (?) or char4_id in (?)", char_ids, char_ids, char_ids, char_ids)
    else
      arel = self.arel_table
      where(
        arel[:char1_id].in(char_ids).and(arel[:char2_id].in(char_ids)).or(
          arel[:char2_id].in(char_ids).and(arel[:char3_id].in(char_ids))
        ).or(
          arel[:char3_id].in(char_ids).and(arel[:char4_id].in(char_ids))
        ).or(
          arel[:char1_id].in(char_ids).and(arel[:char4_id].in(char_ids))
        )
      )
    end
  }

  def value
    @value ||= [char1, char2, char3, char4].map { |ch| ch.try(:char) }.map(&:to_s).join
  end

  def to_s
    begin
      self.value
    rescue => e
      ''
    end
  end

  private

  def presence_all_chars
    unless char1 && char2 && char3 && char4
      errors.add(:value, "の入力が正しくありません")
    end
  end

  class << self
    def create_from_string(string)
      four_phrase = self.new
      if string.size == 4
        transaction do
          begin
            four_phrase.value = string
            four_phrase.char1_id = Character.find_or_create_by(char: string[0]).try(:id)
            four_phrase.char2_id = Character.find_or_create_by(char: string[1]).try(:id)
            four_phrase.char3_id = Character.find_or_create_by(char: string[2]).try(:id)
            four_phrase.char4_id = Character.find_or_create_by(char: string[3]).try(:id)
            four_phrase.save!
          rescue => e
          end
        end
      end
      four_phrase
    end
  end
end



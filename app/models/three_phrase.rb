# == Schema Information
#
# Table name: three_phrases
#
#  id       :integer          not null, primary key
#  char1_id :integer          not null
#  char2_id :integer          not null
#  char3_id :integer          not null
#
# Indexes
#
#  index_three_phrases_on_char1_id                            (char1_id)
#  index_three_phrases_on_char1_id_and_char2_id_and_char3_id  (char1_id,char2_id,char3_id) UNIQUE
#  index_three_phrases_on_char2_id                            (char2_id)
#  index_three_phrases_on_char3_id                            (char3_id)
#

class ThreePhrase < ApplicationRecord
  attr_accessor :value

  belongs_to :char1, class_name: 'Character'
  belongs_to :char2, class_name: 'Character'
  belongs_to :char3, class_name: 'Character'

  validates :char1_id, uniqueness: { scope: [:char2_id, :char3_id], message: I18n.t('activerecord.errors.exists') }

  validates :value, length: { is: 3 }
  validate :presence_all_chars

  before_save do
    %i(char1 char2 char3).each do |column|
      errors.details.delete(column)
    end
  end

  scope :from_string, -> (string, op='or') {
    op = 'or' if op != 'or' and op != 'and'
    char_ids = Character.where(char: string.chars).ids
    if op == 'or'
      where("char1_id in (?) or char2_id in (?) or char3_id in (?)", char_ids, char_ids, char_ids)
    else
      arel = self.arel_table
      where(
        arel[:char1_id].in(char_ids).and(arel[:char2_id].in(char_ids)).or(
          arel[:char2_id].in(char_ids).and(arel[:char3_id].in(char_ids))
        ).or(
          arel[:char1_id].in(char_ids).and(arel[:char3_id].in(char_ids))
        )
      )
    end
  }

  def value
    @value ||= [char1, char2, char3].map { |ch| ch.try(:char) }.map(&:to_s).join
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
    unless char1 && char2 && char3
      errors.add(:value, "の入力が正しくありません")
    end
  end

  class << self
    def create_from_string(string)
      three_phrase = self.new
      if string.size == 3
        transaction do
          begin
            three_phrase.value = string
            three_phrase.char1_id = Character.find_or_create_by(char: string[0]).try(:id)
            three_phrase.char2_id = Character.find_or_create_by(char: string[1]).try(:id)
            three_phrase.char3_id = Character.find_or_create_by(char: string[2]).try(:id)
            three_phrase.save!
          rescue => e
          end
        end
      end
      three_phrase
    end
  end
end

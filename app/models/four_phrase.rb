class FourPhrase < ApplicationRecord
  belongs_to :char1, class_name: 'Character'
  belongs_to :char2, class_name: 'Character'
  belongs_to :char3, class_name: 'Character'
  belongs_to :char4, class_name: 'Character'

  validates :char1, presence: true
  validates :char2, presence: true
  validates :char3, presence: true
  validates :char4, presence: true
  validates :char1_id, uniqueness: { scope: [:char2_id, :char3_id, :char4_id] }

  after_find { self.value = self.to_s }

  attr_accessor :value

  scope :from_string, -> (string) {
    char_ids = Character.where(char: string.chars).ids
    where('char1_id in (?) or char2_id in (?) or char3_id in (?) or char3_id in (?)', char_ids, char_ids, char_ids, char_ids)
  }

  def to_s
    begin
      char1.char + char2.char + char3.char + char4.char
    rescue => e
      ''
    end
  end

  class << self
    def create_from_string(string)
      four_phrase = self.new
      if string.size == 4
        transaction do
          begin
            four_phrase.char1 = Character.find_or_create_by(char: string[0])
            four_phrase.char2 = Character.find_or_create_by(char: string[1])
            four_phrase.char3 = Character.find_or_create_by(char: string[2])
            four_phrase.char4 = Character.find_or_create_by(char: string[3])
            four_phrase.save!
          rescue => e
          end
        end
      end
      four_phrase
    end
  end
end



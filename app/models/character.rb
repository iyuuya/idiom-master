class Character < ApplicationRecord
  validates :char, presence: true


  def three_phrases
    ThreePhrase.from_char(self)
  end
end

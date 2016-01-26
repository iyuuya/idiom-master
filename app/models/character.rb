class Character < ApplicationRecord
  validates :char, presence: true, format: { with: /[一-龠々]/ }, length: { is: 1 }

  def three_phrases
    ThreePhrase.from_char(self)
  end
end

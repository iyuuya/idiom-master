# == Schema Information
#
# Table name: characters
#
#  id   :integer          not null, primary key
#  char :string(255)      not null
#
# Indexes
#
#  index_characters_on_char  (char)
#

class Character < ApplicationRecord
  validates :char, presence: true, format: { with: /[一-龠々]/ }, length: { is: 1 }

  def three_phrases
    ThreePhrase.from_char(self)
  end
end

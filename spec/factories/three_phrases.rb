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

FactoryGirl.define do
  factory :three_phrase do
    association :char1, factory: :character
    association :char2, factory: :character
    association :char3, factory: :character
  end
end

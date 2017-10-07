# == Schema Information
#
# Table name: four_phrases
#
#  id       :integer          not null, primary key
#  char1_id :integer
#  char2_id :integer
#  char3_id :integer
#  char4_id :integer
#
# Indexes
#
#  index_for_phrases_on_char_ids   (char1_id,char2_id,char3_id,char4_id) UNIQUE
#  index_four_phrases_on_char1_id  (char1_id)
#  index_four_phrases_on_char2_id  (char2_id)
#  index_four_phrases_on_char3_id  (char3_id)
#  index_four_phrases_on_char4_id  (char4_id)
#

FactoryGirl.define do
  factory :four_phrase do
    association :char1, factory: :character
    association :char2, factory: :character
    association :char3, factory: :character
    association :char4, factory: :character
  end
end

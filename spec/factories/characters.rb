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

FactoryGirl.define do
  factory :character do
    char { '亜位雨江尾'.split(//).sample }
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if ThreePhrase.count == 0
  File.read(Rails.root.join('db/fixtures/three_phrases.csv')).lines.map(&:chomp).each do |three_phrase|
    ThreePhrase.create_from_string(three_phrase)
  end
end

if FourPhrase.count == 0
  File.read(Rails.root.join('db/fixtures/four_phrases.csv')).lines.map(&:chomp).each do |four_phrase|
    FourPhrase.create_from_string(four_phrase)
  end
end

if Admin.count == 0
  Admin.create(
    email: 'admin@example.com',
    password: 'hogefuga',
    password_confirmation: 'hogefuga'
  )
end

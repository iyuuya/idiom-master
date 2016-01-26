# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

characters = JSON.parse(File.read(Rails.root.join('db/fixtures/characters.json')))

characters.each do |character|
  Character.find_or_create_by(char: character["char"])
end

three_phrases = JSON.parse(File.read(Rails.root.join('db/fixtures/three_phrases.json')))

three_phrases.each do |three_phrase|
  three_phrase.delete("id")
  ThreePhrase.find_or_create_by(three_phrase)
end

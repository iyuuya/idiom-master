class Extractor
  class << self
    def extract
      File.open(Rails.root.join('db/fixtures/characters.json'), 'w') do |f|
        characters = Character.all
        f.write characters.to_json
      end

      File.open(Rails.root.join('db/fixtures/three_phrases.json'), 'w') do |f|
        three_phrases = ThreePhrase.all
        f.write three_phrases.to_json
      end
    end
  end
end

Extractor.extract

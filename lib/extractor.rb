class Extractor
  class << self
    def extract
      File.open(Rails.root.join('db/fixtures/three_phrases.csv'), 'w') do |f|
        three_phrases = ThreePhrase.all
        f.write three_phrases.map(&:to_s).sort.join("\n")
      end

      File.open(Rails.root.join('db/fixtures/four_phrases.csv'), 'w') do |f|
        four_phrases = FourPhrase.all
        f.write four_phrases.map(&:to_s).sort.join("\n")
      end
    end
  end
end

Extractor.extract

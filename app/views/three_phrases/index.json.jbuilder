json.array!(@three_phrases) do |three_phrase|
  json.extract! three_phrase, :id, :char1_id, :char2_id, :char3_id
  json.url three_phrase_url(three_phrase, format: :json)
end

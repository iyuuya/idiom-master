json.array!(@four_phrases) do |four_phrase|
  json.extract! four_phrase, :id, :char1_id, :char2_id, :char3_id, :char4_id
  json.url four_phrase_url(four_phrase, format: :json)
end

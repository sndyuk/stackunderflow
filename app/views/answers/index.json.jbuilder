json.array!(@answers) do |answer|
  json.extract! answer, :id, :post_text
  json.url answer_url(answer, format: :json)
end

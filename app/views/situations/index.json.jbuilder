json.array!(@situations) do |situation|
  json.extract! situation, :id, :nome
  json.url situation_url(situation, format: :json)
end

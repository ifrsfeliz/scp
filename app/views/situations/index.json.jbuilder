json.array!(@situations) do |situation|
  json.extract! situation, :id, :name
  json.url situation_url(situation, format: :json)
end

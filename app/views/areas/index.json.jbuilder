json.array!(@areas) do |area|
  json.extract! area, :id, :nome
  json.url area_url(area, format: :json)
end

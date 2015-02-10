json.array!(@uasgs) do |uasg|
  json.extract! uasg, :id, :codigo, :nome
  json.url uasg_url(uasg, format: :json)
end

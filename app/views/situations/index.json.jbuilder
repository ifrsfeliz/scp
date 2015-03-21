json.array!(@situations) do |situation|
  json.indexLabel situation.nome
  json.y situation.projects.count
end

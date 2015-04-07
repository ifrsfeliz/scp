json.array!(@situations) do |situation|
  json.label situation.nome
  json.y situation.projects.count
end

json.array!(@scholarship_types) do |scholarship_type|
  json.indexLabel scholarship_type.nome
  json.y scholarship_type.projects.count
end




json.array!(@research_groups) do |research_group|
  json.indexLabel research_group.nome
  json.y research_group.research_lines.count
end

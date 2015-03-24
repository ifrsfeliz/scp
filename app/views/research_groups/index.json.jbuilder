json.array!(@research_groups) do |research_group|
  json.extract! research_group, :id, :nome, :researcher_id, :ultima_atualizacao
  json.url research_group_url(research_group, format: :json)
end

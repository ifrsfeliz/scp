json.array!(@projects) do |project|
  json.extract! project, :id, :nome, :researcher_id, :data_inicio, :data_fim, :numero_suap, :nome_edital, :link_cnpq, :ultima_verificacao, :auxilio_aipct, :valor_aipct, :research_line_id, :situation_id
  json.url project_url(project, format: :json)
end

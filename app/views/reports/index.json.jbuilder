json.array!(@reports) do |report|
  json.extract! report, :id, :data_entrega, :atividades_desenvolvidades, :resultados_obtidos, :dificuldades_encontradas, :proximas_etapas, :conclusoes, :referencias, :notificacao_antecipada, :notificacao_no_dia, :notificacao_atrasada, :project_id
  json.url report_url(report, format: :json)
end

FactoryGirl.define do
  factory :project do
    sequence(:nome) { |n| "Projeto #{n}" }
    association :coordenador, factory: :researcher
    data_inicio Time.now - 24.hours
    data_fim Time.now
    numero_suap '1234567'
    nome_edital 'Edital Teste'
    research_line
    situation
    scholarship_type
    valor_aipct 0
  end
end

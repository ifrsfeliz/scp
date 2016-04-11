FactoryGirl.define do
  factory :research_group do
    sequence(:nome) { |n| "Grupo #{n}" }
    area
    link_grupo_cnpq 'http://linkdocnpq.com.br'
    researcher
    ultima_verificacao Time.now
  end
end

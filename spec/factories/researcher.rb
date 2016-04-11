FactoryGirl.define do
  factory :researcher do
    sequence(:nome) { |n| "Pesquisador #{n}" }
    cpf '000.000.000-00'
    sequence(:email) { |n| "pesquisador#{n}@example.com" }
    link_lattes 'http://linkdolates'
    rg '0.000.000'
    telefone '(51) 3637-0000'
    celular '(51) 9999-9999'
  end

end

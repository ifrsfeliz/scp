FactoryGirl.define do
  factory :student do
    sequence(:nome) { |n| "Estudante #{n}" }
    cpf '000.000.000-00'
    sequence(:email) { |n| "pesquisador#{n}@example.com" }
    rg '0.000.000'
    telefone '(51) 3637-0000'
    celular '(51) 9999-9999'
  end

end

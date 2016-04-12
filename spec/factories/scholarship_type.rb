FactoryGirl.define do
  factory :scholarship_type do
    sequence(:nome) { |n| "Tipo Bolsa #{n}" }
  end
end

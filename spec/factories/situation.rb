FactoryGirl.define do
  factory :situation do
    sequence(:nome) { |n| "Situacao #{n}" }
  end
end

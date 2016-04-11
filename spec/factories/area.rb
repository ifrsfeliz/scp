FactoryGirl.define do
  factory :area do
    sequence(:nome) { |n| "Area #{n}" }
  end
end

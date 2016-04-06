FactoryGirl.define do
  factory :role do
    name 'comum'

    trait :admin do
      name 'admin'
    end
  end
end

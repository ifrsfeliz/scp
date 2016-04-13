FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password '12345678'
    admin_authorization true

    trait :as_admin do
      roles { [ Role.where(name: 'admin').first_or_create ] }
    end
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password '12345678'


    trait :with_admin do
      after(:create) do |user, evaluator|
        create_list(:user_role, 1, :with_admin, user: user)
      end
    end
  end
end

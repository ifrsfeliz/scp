FactoryGirl.define do
  factory :user_role do
    user 
    role


    trait :with_admin do
      association :role, factory: :role_admin
    end
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password '12345678'
    admin_authorization true
    roles { [ FactoryGirl.create(:role) ] }

    trait :as_admin do
      roles { [ FactoryGirl.create(:role, :admin) ] }
    end
  end
end

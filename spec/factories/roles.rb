FactoryGirl.define do
  factory :role do
    sequence(:name) { |i| "role#{i}" }
    sequence(:display_order) { |i| i }

    factory :role_admin do
      name Role::ADMIN
      display_order 0
    end

    factory :role_moderator do
      name Role::MODERATOR
      display_order 1
    end

    factory :role_contributor do
      name Role::CONTRIBUTOR
      display_order 2
    end

    factory :role_user do
      name Role::USER
      display_order 3
    end
  end
end

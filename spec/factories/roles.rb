FactoryGirl.define do
  factory :role do
    sequence(:name) { |i| "role#{i}" }

    factory :role_admin do
      name 'admin'
    end

    factory :role_comum do
      name 'comum'
    end

  end
end

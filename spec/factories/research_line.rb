FactoryGirl.define do
  factory :research_line do
    sequence(:nome) { |n| "Linha #{n}" }
    research_group
  end
end

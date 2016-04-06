FactoryGirl.define do
  factory :cms_category, class: 'CMS::Category' do
    sequence(:name) { |n| "Category #{n}" }
    sequence(:display_order) { |n| n }
  end
end

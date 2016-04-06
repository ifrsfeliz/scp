FactoryGirl.define do
  factory :cms_article, class: 'CMS::Article' do
    sequence(:title) { |i|  "Article Title#{i}" }
    sequence(:description) { |i| "Article Description#{i}" }
    content 'Some content'
    extras { Hash.new }
    association :author, factory: [:user]
  end
end

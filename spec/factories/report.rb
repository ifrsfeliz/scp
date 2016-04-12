FactoryGirl.define do
  factory :report do
    periodo_desenvolvimento_inicio Date.today - 60.days
    periodo_desenvolvimento_fim Date.today
    project
  end
end

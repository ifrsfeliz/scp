require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
Capybara.default_max_wait_time = 10

RSpec.configure do |config|
  config.include Capybara::DSL, type: :request
end

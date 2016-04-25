source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# MySQL Gem
gem 'mysql2'

# Compass to avoid error: NameError: uninitialized constant Sprockets::SassCacheStore
gem "compass-rails", git: "https://github.com/Compass/compass-rails.git", branch: "master"

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Whenever - cron tasks
gem 'whenever', :require => false

# Gem used for user authentication
gem 'devise'
gem 'devise-i18n'

# Authorization
gem 'cancancan'

# Let the Selects good to use
gem 'chosen-rails'

# Enum help
gem 'enum_help'

# simple form && datepicker
gem 'simple_form'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
gem 'momentjs-rails', '~> 2.11.1', :github => 'derekprior/momentjs-rails' #dependency of datetimepicker-rails

# Monetize
gem 'money-rails'

# File uploads
gem 'paperclip'

# Annotate models
gem 'annotate', '~> 2.6.8'

gem 'cocoon'

# Pagination and Search
gem 'ransack'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# runtime js to debian
gem 'execjs'
gem 'therubyracer'

# Env vars for configurations
gem 'dotenv-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # rspec-rails is a testing framework for Rails 3.x and 4.x.
  gem 'rspec-rails'

  # factory_girl is a fixtures replacement with a straightforward definition syntax
  gem 'factory_girl_rails'

  # can use pry inside rails console
  gem 'pry-rails'

  # to better display when inspecting elements
  gem 'awesome_print'
end


group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Display better errors
  gem 'better_errors'

  # Open mails when deliver in development
  gem 'letter_opener_web', '~> 1.2.0'

  # Ignore assets on log
  gem 'quiet_assets'
end

group :test do
  # to show test coverage
  gem 'simplecov', require: false

  # use shoulda inspec specs
  gem 'shoulda-matchers', require: false

  # specs for email
  gem 'email_spec'

  # Acceptance test framework for web applications (integration tests)
  gem 'capybara'

  # javascript driver for capybara
  gem 'poltergeist'

  # Record your test suite's HTTP interactions and replay them during future test runs for fast, deterministic, accurate tests.
  gem 'vcr'

  # Database Cleaner is a set of strategies for cleaning your database in Ruby.
  gem 'database_cleaner'

  # Create fake data for testing purpose
  gem 'faker'

  # Report test coverage to codeclimate
  gem 'codeclimate-test-reporter', require: false

  gem 'webmock', '~> 1.24.2'
end

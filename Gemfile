source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# Authentication and Authorization
gem 'devise'
gem 'doorkeeper', '~> 3.1'
gem 'doorkeeper-i18n'

gem 'responders'
gem 'active_model_serializers', '~> 0.10.0.rc5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'bullet'
  gem 'factory_girl_rails'
end

group :test do
  gem 'database_cleaner'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry-rails'
  gem 'guard-rspec', require: false
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
end


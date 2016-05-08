# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
    FactoryGirl.lint
  end

  config.before :each do |example|
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.include RSpec::Rails::ControllerExampleGroup, type: :api
  config.include AuthenticationHelpers, type: :api
  config.include UserAndOwnerHelper, type: :api
  config.include JSONHelpers, type: :api

  config.before :each, type: :api do
    request.headers["accept"] = 'application/vnd.api+json'
  end
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  # Capybara
  Capybara.configure do |config|
    config.run_server = false
    config.current_driver = :rack_test
    config.default_selector = :css
  end

  # Factory Girl
  config.include FactoryGirl::Syntax::Methods

  # Devise
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end

  RSpec.configure do |config|
    config.before(:each, login: true) do
      @user = FactoryGirl.create(:user)
      login_as(@user, scope: :user)
    end
  end

  # Database Cleaner
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
end
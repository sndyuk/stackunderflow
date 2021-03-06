source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'haml-rails'
gem 'turbolinks'
gem 'normalize-rails'
gem 'lodash-rails'
gem 'jbuilder', '~> 2.0'
gem 'enumerize'
gem 'devise'
gem 'delayed_job_active_record'
gem 'simple_form'
gem 'kaminari', '~> 0.16.3'
gem 'lograge'
gem 'email_validator'
gem 'paranoia', '~> 2.0'
gem 'merit'
gem 'websocket-rails'
gem 'marked-rails'
gem 'photoswipe-rails'
gem 'gravatar_image_tag'

group :test do
  gem 'sqlite3'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'better_errors'
  gem 'rails_best_practices'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'terminal-notifier-guard' if RUBY_PLATFORM =~ /darwin/i
end

group :development, :production do
  gem 'mysql2', '~> 0.3.20'
end

group :doc do
  gem 'sdoc', '~> 0.4.0'
end
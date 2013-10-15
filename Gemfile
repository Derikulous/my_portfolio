source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.14'

gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'jquery-rails'
gem 'unicorn'
gem "minitest-rails"

group :development, :test do
  gem 'turn'
  gem 'sqlite3'
  gem "minitest-rails-capybara"
  gem "capybara-webkit"
  gem 'simplecov', :require => false
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
end

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end


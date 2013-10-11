source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.14'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
  gem 'uglifier', '>= 1.0.3'

  gem 'jquery-rails'
end

group :development, :test do
  gem "minitest-rails"
  gem 'turn'
  gem 'sqlite3'
end

group :test do
  gem "minitest-rails-capybara"
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
end

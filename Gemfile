source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '3.2.14'

gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'
gem 'jquery-rails'
gem 'unicorn'
gem 'devise'
gem 'pundit'
gem 'rakismet'
gem 'omniauth-twitter'
gem 'figaro'
gem 'font-awesome-sass'
gem 'skrollr-rails'
gem 'rack-cors', :require => 'rack/cors'
gem 'newrelic_rpm'
gem 'carrierwave'
gem 'rmagick', '2.13.2', :git=>'http://github.com/rmagick/rmagick.git'

group :development, :test do
  gem 'minitest'
  gem 'minitest-rails'
  gem 'turn'
  gem 'sqlite3'
  gem 'minitest-rails-capybara'
  gem 'minitest-focus'
  gem 'minitest-colorize'
  gem 'capybara-webkit'
  gem 'simplecov', :require => false
  gem 'launchy'
  gem 'pry-rails'
  gem 'pry-debugger'
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

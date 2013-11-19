require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/spec"
require "minitest/rails/capybara"
require "minitest/pride"
require "minitest/focus"
require "minitest/colorize"

include Capybara::DSL
include Devise::TestHelpers
DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all
  self.use_transactional_fixtures = false
  puts "Database Cleaning"
  DatabaseCleaner.start

  # Add more helper methods to be used by all tests here...
  # signs in a user
  def sign_in(one)
    puts users(one).email
    visit new_user_session_path
    fill_in "Email", with: users(one).email
    fill_in "Password", with: "password"
    click_on "Sign in"
  end
end

Turn.config.format = :outline

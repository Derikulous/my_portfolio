require 'test_helper'

feature "As a site visitor, I want to be able to sign up for an account so that I can perform
actions that require me to be logged in" do
  scenario "sign up" do
    #Given a registration form
    visit root_path
    page.must_have_content 'Sign Up'
    page.text.wont_include 'Sign Out'
    click_link "Sign Up"

    #When I register with valid info
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "secret123"
    fill_in "Password confirmation", with: "secret123"
    click_on 'Sign up'

    # Then I should be signed up
    page.wont_have_content "There was a problem with your sign up"
    page.text.must_include 'Welcome! You have signed up successfully.'
    page.text.wont_include 'Sign Up'
  end
end

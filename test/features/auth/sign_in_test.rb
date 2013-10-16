require 'test_helper'

feature "As a user, I want to be able to sign in so that I can post to the blog" do
  scenario "Sign in" do

    # Given an existing user
    visit root_path
    click_on "Sign in"

    # When the user creates a new session
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    # Then the user should be signed in
    page.must_have_content "Signed in successfully"
    page.wont_have_content "Sign in"
  end
end

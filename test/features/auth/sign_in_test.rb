require 'test_helper'

feature "As a user, I want to be able to sign in so that I can post to the blog" do
  scenario "Sign in" do

    # Given an existing user
    visit root_path
    click_link "Sign in"

    # When the user creates a new session
    sign_in

    # Then the user should be signed in
    page.must_have_content "Signed in successfully."
  end
end

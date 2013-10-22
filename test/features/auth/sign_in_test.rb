require 'test_helper'

feature "Authorize Signup" do
  scenario "Sign in works" do

    # Given an existing user
    visit root_path
    click_link "Sign In"

    # When the user creates a new session
    sign_in(:one)

    # Then the user should be signed in
    page.must_have_content "Signed in successfully."
    page.text.wont_include "Sign In"
  end
end

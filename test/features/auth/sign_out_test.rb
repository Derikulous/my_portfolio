require 'test_helper'

feature "As a user, I want to be able to sign out so that my session is closed" do
  scenario "Sign out" do

    # Given a signed in user
    visit new_user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_on "Sign in"

    page.must_have_content "Signed in successfully"
    page.must_have_content "Sign out"

    # When the sign out is clicked
    click_on "Sign out"

    #Then the session should be destroyed
    page.must_have_content "Signed out succesffuly"
    page.wont_have_content "Sign out"
  end
end

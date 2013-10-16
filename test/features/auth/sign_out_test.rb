require 'test_helper'

feature "As a user, I want to be able to sign out so that my session is closed" do
  scenario "Sign out" do

    # Given a signed in user
    visit new_user_session_path
    sign_in

    # When the sign out is clicked
    click_on "Sign Out"

    #Then the session should be destroyed

    page.must_have_content "Signed out successfully"
    page.wont_have_content "Sign out"
  end
end

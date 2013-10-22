require 'test_helper'

feature "Authorize signout" do
  scenario "Sign out" do

    # Given a signed in user
    visit new_user_session_path
    sign_in(:two)

    # When the sign out is clicked
    click_on "Sign Out"

    #Then the session should be destroyed
    page.wont_have_content "Logged in as"
    page.must_have_content "Signed out successfully"
  end
end

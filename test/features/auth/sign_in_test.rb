require 'test_helper'

feature "Authorize Signup" do
  scenario "Sign in works" do

    # Given an existing user
    visit root_path
    click_on "Sign In"

    # When the user creates a new session
    sign_in(:one)

    # Then the user should be signed in
    page.must_have_content "Signed in successfully."
    page.text.wont_include "Sign In"
  end

  scenario "sign in with twitter works" do
   visit root_path
   click_on "Sign In"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   page.must_have_content "test_twitter_user, you are signed in!"
 end
end

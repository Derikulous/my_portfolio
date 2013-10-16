require "test_helper"

feature "Creates a Post" do
  scenario "works with valid data" do

      # Given a signed in user
      sign_in
      visit new_post_path

      fill_in "Title", with: posts(:cr).title
      fill_in "Content", with: posts(:cr).content

      # When I submit the form
      click_on 'Create Post'

      # Then I should see the new post
      page.text.must_include "Post was successfully created"
      page.text.must_include posts(:cr).title
      page.has_css? "#author"
      page.text.must_include users(:one).email
  end
end

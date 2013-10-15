require "test_helper"

feature "Creates a Post" do
  scenario "works with valid data" do

      # Given a completed post form
      visit posts_path
      click_on "New"
      fill_in 'Title', :with => 'a new hope'
      fill_in 'Content', :with => 'a long time ago and far far away'

      # When I submit the form
      click_on 'Create Post'

      # Then I should see the new post
      page.must_have_content 'a new hope'
      page.must_have_content 'a long time ago'

  end
end

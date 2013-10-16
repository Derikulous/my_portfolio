require "test_helper"

feature "Edit Post" do
  scenario "submit edited updates to a post" do

    # Given an edited post
    sign_in

    visit post_path(posts(:cr))

    # When I submit the form
    click_on 'Edit'
    fill_in 'Title', with: "Becoming a Web Developer"
    click_on 'Update Post'

    # Then I should see the updated post
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end

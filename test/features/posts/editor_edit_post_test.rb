require "test_helper"

feature "Editor can edit Post" do
  scenario "editor edited a post" do

    # Given an edited post
    sign_in(:one)

    visit post_path(posts(:cz))

    # When I edit the form
    click_on 'Edit'
    fill_in 'Title', with: 'Once upon a time'
    fill_in 'Content', with: 'There was a little rails that could'

    # and then submit form
    click_on 'Update Post'

    # Then I should see the updated post
    page.text.must_include "Post was successfully updated"
    page.text.must_include 'Once upon a time'
  end
end

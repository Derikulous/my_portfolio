require "test_helper"

feature "Editing a post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    sign_in(:one)
    visit post_path(posts(:cr))

    # When I click edit and submit the change
    click_on "Edit"
    fill_in "Title", with: "Code Rails"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include "Post was successfully updated"
  end

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

  scenario "an author edits a post" do
    # Given an author
    sign_in(:author2)

    #When I visit the edit page
    visit post_path(posts(:cz))

    # Then I can edit the unpublished post
    page.wont_have_text 'Published'
  end
end

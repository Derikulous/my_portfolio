require "test_helper"

feature "Delete a Post" do
  scenario "Deletes a post when button is clicked" do

    # Given a post form
    visit posts_path

    # When I click the delete button
    click_on "Delete"

    # Then the post will be deleted and visit back to the index page
    page.wont_have_content "Pick yo"
  end
end

require "test_helper"

feature "Delete a Post" do
  scenario "Deletes a post when button is clicked" do

    # Given a post form
    visit post_path(@post)
    click_on "Back"

    # When I click the delete button
    click_on "Destroy"

    # Then the post will be deleted and visit back to the index page
  end
end

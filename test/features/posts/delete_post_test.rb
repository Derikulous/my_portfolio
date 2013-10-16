  require "test_helper"

feature "Delete a Post" do
  scenario "Deletes a post when button is clicked" do

    # Given an existing post
    sign_in

    visit posts_path

    # When I click the delete button
    click_link("Destroy", href: "/posts/#{posts(:cr).id}")

    # Then the post will be deleted and visit back to the index page
    page.must_have_content posts(:oz).title
  end
end

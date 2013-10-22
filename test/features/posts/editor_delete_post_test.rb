  require "test_helper"

feature "Editor can delete a Post" do
  scenario "editor deletes a post" do

    # Given an existing post
    sign_in(:one)

    visit posts_path

    # When I click the delete button
    click_link("Destroy", href: "/posts/#{posts(:cr).id}")

    # Then the post will be deleted and visit back to the index page
    page.text.wont_include 'Code Rails'
    page.text.wont_include 'This is how I learned web development'
  end
end

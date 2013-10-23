require 'test_helper'

def post_by_author
  sign_in(:author2)
  visit posts_path
  click_on "New Post"
  fill_in "Title", with: "I'm a little teacup"
  fill_in "Content", with: "hear me roar!"
  click_on "Create Post"
  post_id = current_url.split('/').last
end

feature "As a visitor, I want to comment on blog posts" do
  scenario "A visitor creates a comment on a published post" do
    # Given a post page, there exists a published post
    visit posts_path
    post_id = post_by_author
    page.text.must_include "Post was successfully created."

    # There will be a link to add comments
    page.text.must_include "Add comment"

    # When I click to add comment
    click_on "Submit comment"

    # Then I fill in the form
    page.text.must_include 'Add comment'

    # A text field will be generated
    fill_in "Add comment", with: "short and stout"
    click_on "Submit comment"
  end
end
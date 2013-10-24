require 'test_helper'

def comment_by_user
    visit post_path(posts(:oz))
    fill_in :comment_author,        with: "That boy weezee"
    fill_in :comment_author_url,    with: "http://trollme.com"
    fill_in :comment_author_email,  with: "MrT@IPityTheFool.com"
    fill_in :comment_content,       with: "That's weird. Did you create this post in the kitchen?"
    click_on "Submit comment for approval"
end

feature "As an author or editor, I want to approve comments" do
  scenario "A comment cannot be displayed until they approved by an author" do

    # Given a new comment
    comment_by_user
    visit post_path(posts(:oz))
    page.must_have_content "kitchen"
  end

  scenario "Editor can approve comments" do
    # Given an editor who can authorize posts
    sign_in(:editor)

    # A set of comments will be pending approval
    visit post_path(posts(:cz))
    comment_by_user
    # The editor can approve comments
    comment_id = current_url.split('/').last
    click_on 'Approve'

    # When I click on add comment
    visit post_path(posts(:oz))
    page.must_have_content "kitchen"
  end
end

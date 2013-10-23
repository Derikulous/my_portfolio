require 'test_helper'

def comment_by_user
  visit post_path(posts(:oz))
    fill_in :comment_author, with: "That boy weezee"
    fill_in :comment_author_url, with: "trollme.com"
    fill_in :comment_author_email, with: "MrT@IPityTheFool.com"
    fill_in :comment_content, with: "That's weird. Did you create this post in the kitchen?"
    click_on "Submit comment for approval"
end

feature "As an author or editor, I want to approve comments" do
  scenario "A comment cannot be displayed until they approved by an author" do

    # Given a new comment
    comment_by_user
    visit post_path(posts(:oz))
    # and Given an editor, who can authorize posts
    sign_in(:editor)
    visit post_comments_path
    comment_id = current_url.split('/').last

    # A set of comments will be pending
    click_link("Edit", href: "/comments#{comment_id}/edit")

    # When I click on add comment
    click_link("View post and add comment", href: "/posts/#{posts(:cr).id}")

    # Then I fill in the form
    page.text.must_include 'Add comment'

    # and show up on the post show view
    click_on 'Submit comment for approval'
    page.text.must_include 'Comment has been submitted and is awaiting approval.'
  end
end

require 'test_helper'

feature "A person owning the various projects should comment on them" do
  scenario "Add comments on the project page" do

    # Given a project page
    visit project_path(projects(:one))
    # When I add a comment on the project
    fill_in :comment_author, with: "You suck"
    fill_in :comment_author_url, with: "http://youregonnagettrolled.com"
    fill_in :comment_author_email, with: "twerkilate@twerk.com"
    fill_in :comment_content, with: "Did your mom teach you how to twerk?"
    click_on "Submit comment for approval"
    # Then I should see the project and comment
    page.text.must_include "Comment has been submitted and is awaiting approval. "
  end

  scenario "Comments are not allowed if invalid" do
    # Given a project page
    visit project_path(projects(:two))
    # When I submit a comment without attributes
    click_on "Submit comment for approval"
    # Then I should get an error
    page.text.must_include "Author can't be blank"
    page.text.must_include "Author url can't be blank"
    page.text.must_include "Author email can't be blank"
  end
end

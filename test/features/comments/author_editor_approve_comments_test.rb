require 'test_helper'

feature "As an author or editor, I want to approve comments" do
  scenario "A comment cannot be displayed until they approved by an author" do

    # Given an authorized user
    sign_in(:two)
    visit posts_path
    # A set of comments will be pending

    # When I click on approve

    # Then the comment(s) will be allowed
    pending "This is an active issue that needs to be followed up"

    # and show up on the post show view
  end
end

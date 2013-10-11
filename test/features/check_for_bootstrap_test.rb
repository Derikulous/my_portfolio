require "test_helper"

feature "Check for Twitter Bootstrap" do
  scenario "check for jumbotron functionality" do

    # Given an html body
    # When I visit the page
    visit posts_path
    # Then I should see the jumbotron div class
    page.body.must_include "jumbotron"
  end
end

require "test_helper"

feature "Check for Twitter Bootstrap" do
  scenario "check for bootstrap functionality" do

    # Given an html body
    # When I visit the page
    visit root_path
    # Then I should see the jumbotron div class
    page.body.must_include "navbar-responsive-collapse"
  end
end

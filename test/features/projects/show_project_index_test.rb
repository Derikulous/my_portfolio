require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "project page is loading" do

  # Given a couple of projects (loaded from fixtures)

  # When I visit /projects
  visit projects_path

  # Then I should see a list of projects
  page.text.must_include "Game of Thrones"
  page.text.must_include "Deception"
  end
end


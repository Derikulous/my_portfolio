require "test_helper"

feature "As a site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do
  scenario "Deleting an existing project" do

    # Given that I have a project
    visit project_path(projects[:one])

    # When I click the delete button
    click_on "Delete Project"

    # Then I should no longer see a project
    page.text.must_include "Success"
    page.text.must_include "Project deleted"
    page.text.wont_include "Code Fellows Portfolio"


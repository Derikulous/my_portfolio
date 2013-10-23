require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typoes" do
  scenario "editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:one))

    # When I make changes
    fill_in "Name", with: "My Rad Portfolio"
    fill_in "Technologies used", with: "CSS"
    click_on "Update Project"

    # Then the changes should be saved and shown
    page.text.must_include "success"
    page.text.must_include "Rad Portfolio"
    page.text.wont_include "Code Fellows Portfolio"
  end

  scenario "incorrectly editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:one))

    # When I submit invalid changes
    fill_in "Name", with: "Q"
    click_on "Update Project"

    #Then the changes should not be saved and I should try again
    page.text.must_include "Name is too short"
  end
end
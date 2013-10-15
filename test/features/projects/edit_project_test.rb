require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typoes" do
  scenario "editing an existing project" do
    visit edit_project_path(projects(:one))

    fill_in "Name", :with => "My hot mess of a portfolio"
    click_on "Update Project"

    page.text.must_include "Success"
    page.text.must_include "mess of a portfolio"
    page.text.wont_include "Code Fellows Portfolio"
  end
end

feature "As the site owner, I want to edit a project so that I can correct typoes" do
  scenario "incorrectly editing an existing project" do
    # Given an existing project
    visit edit_project_path(projects(:one))

    # When I submit invalid changes
    fill_in "Name", :with => "Err"
    click_on "Update Project"

    #Then the changes should not be saved and I should try again
    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end

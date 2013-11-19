require 'test_helper'

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adds a new project with an image" do
    visit new_project_path
    fill_in "Name", with: "Image test"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap"
    attach_file "Image", "test/fixtures/grainery.jpg"

    # When the form is submitted
    click_on "Create Project"

    # Then a confirmation page should show the new Project
    page.must_have_content "Project was successfully added"
    page.must_have_content "Image test"
    page.must_have_content "Bootstrap"
    within("#project_image") do
      page.body.must_include "grainery.jpg"
    end
  end
end

require "test_helper"

feature "As a site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do
  scenario "Deleting an existing project" do

    # Given that I have a project
    visit projects_path

    # When I click the delete button
    click_link("Destroy", href: "/projects/#{projects(:two).id}")

    # page must display that project was successfully deleted
    page.text.must_include "Project was successfully deleted"

     # page must not have deleted info
    page.text.wont_include "Game of Thrones"
    page.text.wont_include "Deception"
  end
end

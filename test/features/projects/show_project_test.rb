require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "show project specific page" do
    #Given that I have a project
    visit project_path(projects[:two])
    # When I visit the project page
    fill_in "Name", :with => "KFreezePop"
    click_on "Update Project"

    # Then I should see the project specifics
    page.text.must_include "Success"
    page.text.must_include "KFreezePop"
    page.text.wont_include "Code Fellows Portfolio"
  end
end

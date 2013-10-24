require 'test_helper'

feature "A person owning the various projects should comment on them" do
  scenario "Add comments on the project page" do

    # Given a project page
    visit project_path(projects(:one))

    # When I add a comment on the project

    # Then I should see the project and comment
  end
end

require 'test_helper'
  feature "Check main page of a single project is functioning properly" do
    scenario "project page is loading properly" do
      # visit project page
      visit projects_path(projects(:one))

      # Check to see if the name is correct
      page.text.must_include "Game of Thrones"
      page.text.must_include "Deception"
    end
  end

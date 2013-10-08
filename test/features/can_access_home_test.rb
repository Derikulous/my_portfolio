require "minitest_helper"

feature "Can Access Home Feature Test" do
  scenario "has content" do
    visit root_path
    assert page.has_content?("Home#index")
  end
end

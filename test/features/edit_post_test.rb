require "test_helper"

feature "Edit Post" do
  scenario "submit edited updates to a post" do

    #Given an edited post
    visit post_path(@post)
    click_on "Edit"
    fill_in 'Title', :with => 'Yoda was wise'
    fill_in 'Content', :with => 'There is no try.'

    # When I submit the form
    click_on 'Update Post'

    # Then I should see the updated post
    page.text.must_include 'Yoda'
    page.text.must_include 'There is no try.'
  end
end

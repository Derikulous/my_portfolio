require "test_helper"

feature "Editor creates a post" do
  scenario "editor publihes a post" do

    # Given a signed in editor
    sign_in(:one)
    visit posts_path

    # Page will have an unpublished post
    fill_in "Title", with: posts(:oz).title
    fill_in "Content", with: posts(:oz).content

    # When the editor clicks the Create Post
    click_on 'Create Post'

    # sign out
    click_on 'Sign Out'

    # Navigate to the index page
    visit posts_path

    # Then I should see the new post
    page.text.must_include posts(:oz).title
    page.text.must_include users(:one).email
  end
end

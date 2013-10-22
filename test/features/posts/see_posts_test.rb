require 'test_helper'

feature "I can see all posts" do
  scenario "with existing posts" do
    # Given a posts index
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include posts(:cz).title
    page.text.must_include posts(:oz).content

  end

  scenario "editor can see posts in blog index and choose which to publish" do
    # Given a signed in editor
    sign_in(:one)

    # When I visit the index page
    visit posts_path

    # Then I should see the new post
    page.text.must_include posts(:oz).title
    page.text.must_include posts(:cz).title
    page.text.must_include posts(:cr).content
  end

  scenario "an author can see all posts" do
    # Given a signed in author
    sign_in(:author2)

    # When I visit post index
    visit posts_path

    # Then both published and ubpublished posts should be there
    page.text.must_include posts(:cz).title
    page.text.must_include posts(:oz).content
  end
end

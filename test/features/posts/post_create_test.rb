require "test_helper"

feature "Creating a post" do
  scenario "Create a form" do
    # Given an authorized user
    sign_in(:one)
    visit new_post_path

    fill_in "Title", with: posts(:cz).title
    fill_in "Content", with: posts(:cz).content

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cz).title
    assert page.has_css? "#author"
    page.text.must_include "By: #{users(:one).email}"
  end

  scenario "editor publishes a post" do

    # Given a signed in editor
    sign_in(:one)
    visit posts_path

    # Page will have an unpublished post
    page.text.must_include 'Pick yo Knight!'

    # When the editor clicks the Publish Post
    page.text.must_include 'New Post'
    click_link 'New Post'

    # sign out
    click_on 'Sign Out'

    # Navigate to the index page
    visit posts_path

    # Then I should see the new post
    page.text.must_include posts(:oz).title
  end

  scenario "authors can't publish" do

    # Given a post from author one
    sign_in(:one)
    # When I visit the new page
    visit new_post_path

    # Then there is no button for published
    page.wont_have_field('published')
  end

  scenario "site visitors cannot see new post button" do
    # When I visit the index page
    visit posts_path
    # Then I should not see the "New Post" button
    page.text.wont_include "New Post"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    #Given a site visitor, and they visit the new_post_path
    visit new_post_path
    # Then they will be shown an error
    page.must_have_content "You need to sign in or sign up before continuing"
  end
end


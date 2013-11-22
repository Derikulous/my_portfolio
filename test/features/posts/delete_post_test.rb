require "test_helper"

def set_up_a_post_by_author
  # Given a logged in author
  sign_in(:author2)
  # And a post by that author
  visit posts_path
  click_on "New Post"
  fill_in "Title", with: "I am author 2"
  fill_in "Content", with: "hear me roar!"
  click_on "Create Post"
  # figure out the post id from the page url
  post_id = current_url.split('/').last
end

feature "Deleting a Post" do
  scenario "editor deletes a post" do

    # Given an existing post
    sign_in(:one)
    visit posts_path
    save_and_open_page

    # When I click the delete button
    click_link("Destroy", href: "/posts/#{posts(:cr).id}")

    # Then the post will be deleted and visit back to the index page
    page.text.wont_include 'Code Rails'
    page.text.wont_include 'This is how I learned web development'
  end

  scenario "author can delete a post" do
    # Given an existing post
    sign_in(:two)
    visit posts_path

    # When delete button is clicked
    click_link("Destroy", href: "/posts/#{posts(:cz).id}")

    # Then the post is deleted
    page.must_have_content "Code Rails"
    page.must_have_content posts(:oz).title
    page.must_have_content posts(:cr).title
  end

  scenario "an editor can delete all posts" do
    #Given a signed in editor
    post_id = set_up_a_post_by_author
    page.must_have_content "Post was successfully created"
    click_link 'Back to the blog'
    click_on 'Sign Out'

    #When I visit the posts path
    sign_in(:editor)
    visit posts_path
    click_link("Destroy", href: "/posts/#{post_id}")

    # Then the page won't have deleted content
    page.wont_have_content "hear me roar!"
  end

  scenario "author can delete unpublished posts" do
    # Given an unpublished author post
    post_id = set_up_a_post_by_author
    click_on "Back"
    click_link "Destroy", href: "/posts/#{post_id}"
    # Then the post should not be in the index
    page.wont_have_content "I am author 2"
  end
end

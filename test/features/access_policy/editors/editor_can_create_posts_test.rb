require "test_helper"

feature "Editor has certain capabilities" do
  scenario "As an Editor, I want to create new posts of my own" do
    # Given a logon as author,
    sign_in(:editor)

    #When I visit the new post page
    visit new_post_path

    # and complete the post
    fill_in "Title", with: posts(:cr).title
    fill_in "Body",  with: posts(:cr).body

    # and I submit form
    click_on "Create Post"

    #Then a new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).body
    page.has_css? "#author"
    page.text.must_include users(:editor).email
    page.text.must_include "Status: Unpublished"
  end
end

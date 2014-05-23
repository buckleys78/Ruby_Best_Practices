require "test_helper"

feature "Visitor has certain capabilities" do

  scenario "As a Visitor, I want to comment on a post" do
    # Given no logon creds

    #When I visit the new post page
    visit post_path(posts(:editors_pub_post))

    click_on 'New Comment'
save_and_open_page
    # and comment on the post
    fill_in "Content", with: "My thoughts"

    # and I submit form
    click_on "Create Comment"

    #Then a new post should be created and displayed
    page.text.must_include "Comment was successfully created"

  end
end

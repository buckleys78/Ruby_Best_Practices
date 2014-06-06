require "test_helper"

feature "Visitor has certain capabilities" do

  scenario "As a Visitor, I want to comment on a post" do
    # Given no logon creds

    #When I visit the new post page
    visit post_path(posts(:editors_pub_post))
    # and click on the new comment link

    click_on 'New Comment'

    # and comment on the post
    fill_in "Your name", with: "Troll"
    fill_in "Your email", with: "iamatroll@caveman.com"
    fill_in "Content", with: "My thoughts"
    # and I submit form

    click_on "Submit comment for approval"

    #Then a new post should be created and displayed
    page.must_have_content "Comment is awaiting consideration"

  end
end

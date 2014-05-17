require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "Visitor cannot get to New Posts" do

    #Given that I am not signed in,

    #When I visit the post index,
    visit posts_path

    #Then I won't see the link to make a new post.
    page.wont_have_link "New Post"
  end
end

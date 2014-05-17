require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "Visitor cannot get to New Posts" do
    #Given that I am not signed in,

    #If i get to new post path
    visit new_post_path

    #Then I won't have the link to make a new post.
    page.wont_have_link "New Post"
  end

end

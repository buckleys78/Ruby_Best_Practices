require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As an Visitor, I cannot visit new_post_path" do

    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"

  end

  scenario "As a Visitor, I cannot see the new post button" do
    visit posts_path
    page.wont_have_link "New Post"
  end
end

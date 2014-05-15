require "test_helper"

feature "Editing A Post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    sign_in
    #post = posts(:cr).title
    #post = Post.create(title: posts(:cr).title, body: posts(:cr).body)

    visit post_path(posts(:cr))
    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Development"
    click_on "Update Post"

    # Then the post is updated.
    page.text.must_include "Post was successfully updated."
    page.text.must_include "Web Development"

  end
end

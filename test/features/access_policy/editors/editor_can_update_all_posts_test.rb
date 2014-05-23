require "test_helper"

feature "Editor has certain capabilities" do
  scenario "As an Editor, I can see update my own posts." do

    # Given an existing post of my own,
    sign_in(:editor)
    visit post_path(posts(:editors_pub_post))

    # When I click Edit and Update the post,
    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    # Then the post is updated.
    page.text.must_include "Post was successfully updated."
    page.text.must_include "Web Developer"
    page.wont_have_content posts(:editors_pub_post).title

  end

  scenario "As an Editor, I cannot edit other people's posts." do

    # # Given an existing post
    # sign_in(:editor)
    # visit post_path(posts(:cr))

    # # When I click Edit and Update the post,
    # click_on "Edit"
    # fill_in "Title", with: "Becoming a Web Developer"
    # click_on "Update Post"

    # # Then the post is updated.
    # page.text.must_include "Post was successfully updated."
    # page.text.must_include "Web Developer"
    # page.wont_have_content posts(:cr).title

  end
end

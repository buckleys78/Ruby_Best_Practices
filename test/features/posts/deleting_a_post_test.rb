require "test_helper"

feature "Deleting A Post" do
  scenario "As Editor, clicking delete removes the record" do
    # Given I have Editor credentials, an existing post,
    sign_in (:editor)
    post = posts(:cr)
    visit posts_path
    # and the title is confirmed present,
    page.must_have_content post.title

    # When I click delete
    page.find('tr', :text => post.title).click_on "Destroy"

    # Then the post is removed from the page.
    page.wont_have_content post.title
  end
end

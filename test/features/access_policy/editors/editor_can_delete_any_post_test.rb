require "test_helper"

feature "Editor has certain capabilities" do

  scenario "As an Editor, I can delete any post" do
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

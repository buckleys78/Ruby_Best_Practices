require "test_helper"

feature "Author has certain capabilities" do
  scenario "As an Author, I can delete my own posts" do
    # Given I have Author credentials, an existing post,
    sign_in (:one)
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

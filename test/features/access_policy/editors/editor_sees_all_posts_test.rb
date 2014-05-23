require "test_helper"

feature "Editor has certain capabilities" do
  scenario "As an Editor, I can see all posts" do

    # Given I am signed in with Author credentials,
    sign_in(:editor)

    # When I view post index,
    visit posts_path

    # Then I only see my posts,
    page.must_have_content posts(:editors_pub_post).title
    page.must_have_content posts(:editors_unpub_post).title
    # and I can see other people's posts, published or no.
    page.must_have_content posts(:pubpost).title
    page.must_have_content posts(:unpubpost).title
  end
end

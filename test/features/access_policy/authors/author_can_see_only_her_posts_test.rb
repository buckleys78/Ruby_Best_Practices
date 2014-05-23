require "test_helper"

feature "Author has certain capabilities" do
  scenario "As an Author, I want to see only my own posts" do

    # Given I am signed in with Author credentials,
    sign_in(:one)

    # When I view post index,
    visit posts_path

    # Then I only see my own posts.
    page.must_have_content posts(:pubpost).title
    page.wont_have_content posts(:twos_post).title

  end
end

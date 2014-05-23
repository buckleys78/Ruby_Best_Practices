require "test_helper"

feature "Author has certain capabilities" do
  scenario "As an Author, I cannot publish my posts" do

    # Given that I sign in with author creditials,
    sign_in(:author)

    # When I visit the New Post page,
    visit post_path(posts(:unpubpost))
    #visit new_post_path

    # Then I will not see the Publish checkbox
    page.wont_have_field("Published")

  end
end

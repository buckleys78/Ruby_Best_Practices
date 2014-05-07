require "test_helper"

feature "Deleting A Post" do
  scenario "clicking delete removes the record" do
    # Given an existing post
    post = Post.create(title: "Becoming a Code Fellow",
                                    body: "Means striving for excellence.")
    visit post_path(post)

    # When I click delete
    click_on "Destroy"

    # Then the post is removed from the database.
    page.wont_have_content "Becoming a Code Fellow."
  end
end

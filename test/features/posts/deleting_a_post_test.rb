require "test_helper"

feature "Deleting A Post" do
  scenario "clicking delete removes the record" do
    # Given an existing post
    post = posts(:cr)
    visit posts_path

    # When I click delete
    page.find("tbody tr:last").click_on "Destroy"

    # Then the post is removed from the database.
    page.wont_have_content "Code Rails"
  end
end

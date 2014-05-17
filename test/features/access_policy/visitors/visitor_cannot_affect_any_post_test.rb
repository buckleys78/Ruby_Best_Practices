require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As an Visitor, I am Read-only" do

    # Given I am not signed in,

    # When I view posts
    visit posts_path

    # Then I can't see links to Edit or Destroy posts.
    page.wont_have_link "Edit"
    page.wont_have_link "Destroy"

  end

end

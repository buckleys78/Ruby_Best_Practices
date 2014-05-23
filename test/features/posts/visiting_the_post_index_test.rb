require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts" do
    # Given existing posts
    #post = posts(:cr).title

    # When I visit the Post index
    visit posts_path

    # Then the existing posts should be loaded
    page.must_have_content posts(:cr).title
  end
end

require "test_helper"

feature "Editor has certain capabilities" do
  scenario "As an Editor, I can publish any post" do

    #Given
    sign_in(:editor)

    #When
    visit new_posts_path
    #Then
    page.must_have_field('Published')

    #When
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"
    #Then
    page.text.must_include "Status: Published"

  end
end

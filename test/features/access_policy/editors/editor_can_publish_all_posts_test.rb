require "test_helper"

feature "Editor has certain capabilities" do
  scenario "As an Editor, I can publish my post" do

    #Given
    sign_in(:editor)

    #When
    visit new_post_path

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

  scenario  "As an Editor, I can publish another author's post" do

    # Given that I sign in with editor creditials,
    sign_in(:editor)

    # When I visit the page to edit an existing post,
    visit post_path(posts(:unpubpost))
    page.text.must_include "Status: Unpublished"
    click_on "Edit"

    # Then I will not see the Publish checkbox
    page.must_have_field('Published')
    # and I can publish the post
    check "Published"
    click_on "Update Post"
    # and
    page.text.must_include "Status: Published"

  end
end

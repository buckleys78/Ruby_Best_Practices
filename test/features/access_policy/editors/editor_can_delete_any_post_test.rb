require "test_helper"

feature "Editor has certain capabilities" do
  scenario "As an Editor, I can delete any post" do

    # Given I am logged on as Editor
    sign_in(:editor)

    # When I click destroy
    title = posts(:cr).title
    visit posts_path
    #page.must_have_content title
    page.find('tr', :text => title).click_on "Destroy"

    # Then the post is deleted.
    #page.wont_have_content "Code Rails"
    page.wont_have_content title

  end
end

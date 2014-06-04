require "test_helper"

feature "Visitor has certain capabilities" do

  scenario "As a Visitor, I want to comment on a project" do
    # Given no logon creds

    #When I visit the new project page
    visit project_path(projects(:editors_pub_project))
    # and click on the new comment link
    click_on 'New Comment'
    # and comment on the project
    fill_in "Content", with: "My thoughts"
    # and I submit form
    click_on "Create Comment"

    #Then a new comment should be created.
    page.text.must_include "Comment was successfully created"

  end
end

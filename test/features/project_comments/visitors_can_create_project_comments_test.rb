require "test_helper"

feature "Visitor has certain capabilities" do

  scenario "As a Visitor, I want to comment on a project" do
    # Given no logon creds

    #When I visit the new project page
    visit project_path(projects(:editors_pub_project))
    # and click on the new comment link
    click_on 'New Comment'

    # and comment on the project
    fill_in "Your name", with: "Thoughtful Tom"
    fill_in "Your email", with: "tt@example.com"
    fill_in "Content", with: "My thoughts exactly"
    # and I submit form
    click_on "Submit comment for approval"

    #Then a new comment should be created.
    page.text.must_include "Comment is awaiting consideration"

  end
end

require "test_helper"

feature "Creating A Project" do
  scenario "can create a new project" do
    #given that I click on a form to create new project
    visit projects_path

    # when I fill in the form
    click_on "New project" #locator (String) — Text, id or value of link or button
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Zurb, HTML5, CSS3"
    click_on "Create Project"

    # then I see the new project.
    page.text.must_include "Project has been created."
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end
end

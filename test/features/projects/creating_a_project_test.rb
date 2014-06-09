require "test_helper"

feature "Creating A Project" do
  scenario "an author can create a new project" do
    #given that I sign in and click on a form to create new project
    sign_in(:author)
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

  scenario "an invalid/incompete form can not be submitted" do
    #given that the form data is invalid,
    sign_in(:author)
    visit new_project_path
    fill_in "Name", with: "A"
    fill_in "Technologies used", with:""

    #when the form is submitted
    click_on "Create Project"

    #then the user is redirected back to the page
    current_path.must_match /projects$/   #= /projects/5
    # and an alert is given.
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end

  scenario "a visitor cannot create or edit projects" do
    #given that I am not signed in,

    #when I visit the project index,
    visit projects_path

    #then I will not see options to edit or destroy project listings,
    page.wont_have_link "Edit"
    page.wont_have_link "Destroy"
    # and I will not see options to create a new project.
    page.wont_have_link "Create Project"
  end
end

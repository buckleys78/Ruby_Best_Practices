require "test_helper"

feature "Editing a Project" do
  scenario "an existing project can be edited" do
    #Given an existing project, and I am signed in as its author,
    sign_in(:author)
    visit edit_project_path(projects(:project_before_edit))

    #When a project's name and technologies are edited
    fill_in "Name", with: projects(:project_after_edit).name
    fill_in "Technologies used", with:  projects(:project_after_edit).technologies_used
    click_on "Update Project"

    #Then the new name and technology info should match.
    page.text.must_include "success"
    page.text.must_include projects(:project_after_edit).name
    page.text.must_include projects(:project_after_edit).technologies_used
  end

  scenario "Invalid/incompete form editing" do
    #given that the form data is invalid,
    sign_in(:author)
    visit edit_project_path(projects(:project_before_edit))
    fill_in "Name", with: "A"
    fill_in "Technologies used", with:""

    #when the form is submitted
    click_on "Update Project"

    #then the user is redirected back to the page
    current_path.must_include projects(:project_before_edit).id.to_s
    # and an alert is given.
    page.text.must_include "prohibited being saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end

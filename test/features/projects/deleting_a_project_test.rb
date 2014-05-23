require "test_helper"

feature "Delete a Project" do
  scenario "deleting a project from the list" do
    #Given I visit the projects page
    visit projects_path

    #When I destroy a project,
    first(:link, "Destroy").click

    #Then the page confirms the project was deleted.
    page.text.must_include "Project was successfully destroyed"
  end
end

require "test_helper"

feature "Delete a Project" do
  scenario "deleting a project from the list" do
    #When visting
    visit projects_path
    first(:link, "Destroy").click
    page.text.must_include "Project was successfully destroyed"
  end
end

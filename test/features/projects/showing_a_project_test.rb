require "test_helper"

feature "Showing a single project" do
  scenario "A selected project is found" do

    #Given a project exits
    projects(:project_before_edit)

    #When that project is chosen
    visit projects_path

    first(:link, "Show").click

    #Then the project information is shown
    page.text.must_include projects(:project_before_edit).name
    page.text.must_include projects(:project_before_edit).technologies_used
  end
end

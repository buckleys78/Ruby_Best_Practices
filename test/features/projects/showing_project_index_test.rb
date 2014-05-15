require "test_helper"

feature "Showing Project Index" do
  scenario "show index of all projects" do
    #Given some projects loaded from fixture
    projects(:freelance)
    projects(:portfolio)

    #When the project list index is called
    visit projects_path

    #Then the fixture projects should display
    page.text.must_include projects(:freelance).name
    page.text.must_include projects(:portfolio).name
  end
end

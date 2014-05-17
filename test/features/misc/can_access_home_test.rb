require "test_helper"

feature "CanAccessHome" do
  scenario "the test is sound" do
    #Given I visit the site,
    visit root_path

    #Without doing anything

    #Then the welcome page should have my name.
    page.must_have_content "Steve Buckley"
  end
end

require "test_helper"

feature "CanAccessHome" do
  scenario "the test is sound" do
    visit root_path
    #page.must_have_content "Hello World"
    page.must_have_content "Steve Buckley"
  end
end

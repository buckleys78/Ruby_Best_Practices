require "test_helper"

feature "Check For Zurb gem" do
  scenario "Zurb implemented" do
    #Given that Zurb has been employed,
    visit root_path
    #When the homepage is visited,
    page.html.must_include "foundation_and_overrides.css"
    #Then a stylesheet with Zurb in the name is found.
  end
end

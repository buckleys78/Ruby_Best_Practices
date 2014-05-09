require "test_helper"

feature "Check For Theme" do
  scenario "the theme components are loaded" do
    # Given that the theme has been loaded,

    # When the homepage loads
    visit root_path

    #Then a stylesheet from the Theme file set is found.
    page.html.must_include "foundation.min.css"
  end
end

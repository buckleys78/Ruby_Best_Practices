require "test_helper"

feature "Can Find Public Site" do
  scenario "the public web addr gets to the home page" do
    # Given the site is loaded to Heroku,

    # When the address is requested,
    visit "http://Steve-Buckley.com"


    # The welcome page delivers expected content.
    page.must_have_content "Steve Buckley"

  end
end

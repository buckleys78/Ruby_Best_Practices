require "test_helper"

feature "As a site visitor, I want to be able to sign in to my account" do
  scenario "sign in" do
    # Given a registration form
    visit "/users/sign_in"

    # When I give my credentials
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_on "Sign in"

    # Then I should be signed up.
    page.will_have_content "signed in"
    page.wont_have_content "signed out"
  end
end

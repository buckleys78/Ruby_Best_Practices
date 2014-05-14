require "test_helper"

feature "As a site visitor, I want to be able to sign out" do
  scenario "sign out" do
    # Given a registration form
    visit "/users/sign_in"

    # When I click on the sign-out button
    click_on "Sign out"

    # Then I should be signed out
    page.will_have_content "signed out"
    page.wont_have_content "signed in"
  end
end

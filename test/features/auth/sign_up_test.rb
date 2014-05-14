require "test_helper"

feature "As a site visitor, I want to be able to get an account" do
  scenario "sign up" do
    # Given a registration form
    visit "/"
    click_on "Sign Up"

    # When I register with valid info
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    # Then I should be signed up.
    page.must_have_content "signed up successfully"
    page.wont_have_content "problem with your sign up"
  end
end

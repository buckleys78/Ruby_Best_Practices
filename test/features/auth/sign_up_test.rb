require "test_helper"

feature "As a site visitor, I want to be able to get an account" do
  scenario "sign up" do
    # Given a new user registration form,
    visit new_user_registration_path

    # When I register with valid info,
    # NOTE: do not use a fixture, will reject duplicate emails.
    fill_in "Email", with: "new_user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button("Sign up", :match => :first)

    # Then I should be signed up and signed in.
    page.must_have_content "signed up successfully"
    page.wont_have_content "error prohibited this user from being saved"
    page.must_have_content "Sign out"
  end
end

require "test_helper"

feature "As a site visitor, I want to be able to sign out" do
  scenario "sign out" do
    # Given a valid sign in,
    #visit "/users/sign_in"
    visit user_session_path
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"

    # When I click on the sign-out link
    click_on("Sign out", :match => :first)

    # Then I should be signed out
    page.should have_content "signed out"
    page.wont have_content "signed in"
  end
end

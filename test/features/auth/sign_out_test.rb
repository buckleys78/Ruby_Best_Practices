require "test_helper"

feature "As a site visitor, I want to be able to sign out" do
  scenario "sign out" do
    # Given a valid sign in,
    #visit "/users/sign_in"
    #puts "THIS IS THE RAILS ENVIRONMENT #{Rails.env}"
    visit user_session_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"

    # When I click on the sign-out link
    click_link "Sign out"
    #click_link("Sign out", :match => :first)

    # Then I should be signed out
    visit root_path
    page.should have_content "Signed out"
    page.wont have_content "Signed in"
  end
end

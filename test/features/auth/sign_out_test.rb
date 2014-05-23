require "test_helper"

feature "As a site visitor, I want to be able to sign out" do
  scenario "sign out" do

    # Given a valid sign in,
    sign_in(:one)

    # When I click on the sign-out link
    click_link("Sign out", :match => :first)

    # Then I should be signed out
    page.must_have_content "Signed out"
  end
end

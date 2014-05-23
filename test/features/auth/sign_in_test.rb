require "test_helper"

feature "As a site visitor, I want to be able to sign in to my account" do
  scenario "explicit sign_in" do
    # Given a sign-in form,
    visit user_session_path

    # When I give my credentials

    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_button("Sign in", :match => :first)

    # Then I should be signed in.
    page.text.must_include("Sign out")
    page.text.must_include("Signed in successfully")
  end

  scenario "revised sign_in using helper method" do

    sign_in(:one)

    # Then I should be signed in.
    page.text.must_include("Sign out")
    page.text.must_include("Signed in successfully")
  end
end

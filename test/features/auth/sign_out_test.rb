require "test_helper"

feature "As a site visitor, I want to be able to sign out" do
  scenario "sign out" do
    # Given a valid sign in,
    # visit user_session_path  #visit "/users/sign_in"
    # fill_in "Email", with: users(:one).email
    # fill_in "Password", with: "password"
    # click_button("Sign in", :match => :first)
    # page.text.must_include("Signed in successfully")
    sign_in(:one)

    # When I click on the sign-out link
    visit root_path
    # save_and_open_page
    click_link "Sign out"
    #click_link("Sign out", :match => :first)

    # Then I should be signed out


    # page.should have_content "Signed out"
    # page.wont have_content "Signed in"
    # page.text.must_include("Sign out")
    # page.text.must_include("Signed in successfully")
  end
end

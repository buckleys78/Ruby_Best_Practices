require "test_helper"

feature "As a site visitor, I want to be able to sign in to my account" do
  scenario "sign in" do
    # Given a sign-in form,

    #puts "THIS IS THE RAILS ENVIRONMENT #{Rails.env}"
    visit user_session_path

    # When I give my credentials
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_button("Sign in", :match => :first)
    #save_and_open_page

    # Then I should be signed in.
    visit root_path
    page.text.must_include("Sign In")
    #page.wont have_content("Sign Out")
  end
end

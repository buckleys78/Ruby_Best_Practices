require "test_helper"

feature "As a site visitor, I want to be able to get an account" do
  scenario "sign up" do
    # Given a registration form
    #puts "THIS IS THE RAILS ENVIRONMENT #{Rails.env}"
    visit "/users/sign_up"
    #binding.pry
    # When I register with valid info
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on("Sign up", :match => :first)
    #save_and_open_page

    # Then I should be signed up.
    visit root_path
    # page.must_have_content "signed up successfully"
    # page.wont_have_content "problem with your sign up"
  end
end

# require "test_helper"

# feature "As a site visitor, I want to be able to sign in to my account" do
#   scenario "sign in" do
#     # Given a sign-in form,

#     puts "THIS IS THE RAILS ENVIRONMENT #{Rails.env}"
#     visit user_session_path
#     # When I give my credentials
#     fill_in "Email", with: users(:one).email
#     fill_in "Password", with: "password"
#     save_and_open_page
#     click_on("Sign in", :match => :first)
#     #save_and_open_page

#     # Then I should be signed in.
#     #page.should have_content('foo')
#     page.text.must_include('Signed in')
#     #page.should have_content('signed in')
#     page.wont have_content("signed out")
#   end
# end

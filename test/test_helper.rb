puts "RAILS ENV: " + Rails.env + "."
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "pry-nav"
require "pry-stack_explorer"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!
    ActiveRecord::Migration.maintain_test_schema!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in(role = :editor)
    #puts "User: " + users(:one).email
    #puts "Count: " + User.all.count.to_s
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: "password"
    click_button("Sign in")
  end
end




#class ActionDispatch::IntegrationTest
 # include Capybara::DSL
  #include Capybara::Assertions
#end



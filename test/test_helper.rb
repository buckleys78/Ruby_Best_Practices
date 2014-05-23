require 'simplecov'
SimpleCov.command_name 'minitest'
SimpleCov.start 'rails'

Rails.env = "test"
puts "RAILS ENV: " + Rails.env + "."

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
  def sign_in(user_fixture)
    visit user_session_path
    fill_in "Email", with: users(user_fixture).email
    fill_in "Password", with: "password"
    click_button("Sign in")
  end

# def new_post
#   visit new_post_path
#   fill_in "Title", with: posts(:cr).title
#   fill_in "Body", with: posts(cr:).body
#   click_on "Create Post"
# end

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
end

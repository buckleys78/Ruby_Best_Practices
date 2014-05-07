require "test_helper"

class StaticHomePageTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Hello World"
    refute_content page, "Goobye All!"
  end
end


describe "Can Access Home", :capybara do
  it "has content" do
    visit root_path
    page.must_have_content "Home#index"
  end
end

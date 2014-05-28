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

   scenario "sign in with twitter works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    click_on "Sign in with Twitter"
    save_and_open_page
    page.must_have_content "test_twitter_user, you are signed in!"
    # Courtesy of: https://gist.github.com/ivanoats/7071730
    # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  end
end

require "test_helper"

feature "Contact mailer capabilites" do

  scenario "As a Visitor, I want to send an email." do
    # Given no logon creds

    #When I visit the contacts page from the home page
    visit root_path

    # and click on the new comment link
    click_on 'Contact me', :match => :first

    # and comment on the post
    fill_in "Name", with: "Interested Ivan"
    fill_in "Email", with: "iamarecruiter@bigcompany.com"
    fill_in "Message", with: "I want to hire you!"

    # and I submit form
    click_on "Submit"

    #Then a new post should be created and displayed
    page.must_have_content "Your message has been sent"

  end
end

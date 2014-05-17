require "test_helper"

feature "Author has certain capabilities" do
  scenario "As an Author, I cannot publish my posts" do

    sign_in(:author)

    visit new_post_path

    page.wont_have_field("Published")

  end
end

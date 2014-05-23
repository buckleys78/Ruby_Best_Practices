require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As a Visitor, I cannot see unpublished posts." do

    #Given that two posts are in the DB, one published, and
    # the other unpublished.
    pub_post = posts(:pubpost)
    unpub_post = posts(:unpubpost)

    #When visitor visits the 'show' page
    visit posts_path

    #Then only the published post should be visible
    page.must_have_content posts(:pubpost).title
    page.wont_have_content posts(:unpubpost).title
  end
end

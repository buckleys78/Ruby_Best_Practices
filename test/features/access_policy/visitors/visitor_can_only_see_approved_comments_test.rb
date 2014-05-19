require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As a Visitor, I cannot see unapproved comments." do

    #Given that two comments are in the DB, one published, and
    # the other unpublished.
    approved_comment = comments(:appr_comment_on_editors_post)
    unapproved_comment = comments(:unappr_comment_on_editors_post)

    #When visitor visits the 'show' page for a given post
    visit post_path(posts(:editors_pub_post))

    #Then only the published post should be visible
    page.must_have_content comments(:appr_comment_on_editors_post).content
    page.wont_have_content comments(:unappr_comment_on_editors_post).content
  end
end

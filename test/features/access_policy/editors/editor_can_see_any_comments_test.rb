require "test_helper"

feature "Editor has certain capabilities" do
  scenario "As a Editor, I can see unapproved comments on my own posts." do

    #Given that two comments are in the DB, one published, and
    # the other unpublished.
    approved_comment = comments(:appr_comment_on_authors_post)
    unapproved_comment = comments(:unappr_comment_on_authors_post)

    #When I visit the 'show' page for a given post
    visit post_path(posts(:authors_pub_post))

    #Then all comments should be visible
    page.must_have_content comments(:appr_comment_on_authors_post).title
    page.must_have_content comments(:appr_comment_on_authors_post).title
  end

  scenario "As a Editor, I can see unapproved comments on other posts." do

    #Given that two comments are in the DB, one published, and
    # the other unpublished.
    approved_comment = comments(:appr_comment_on_editors_post)
    unapproved_comment = comments(:unappr_comment_on_editors_post)

    #When visitor visits the 'show' page for a given post
    visit post_path(posts(:editors_pub_post))

    #Then only the published post should be visible
    page.must_have_content comments(:appr_comment_on_editors_post).title
    page.must_have_content comments(:appr_comment_on_editors_post).title
  end
end

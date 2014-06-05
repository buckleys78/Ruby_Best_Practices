require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As a Visitor, I can only see approved comments." do

    #Given that two comments are in the DB, one published, and
    # the other unpublished.
    post = posts(:editors_pub_post)

    approved_comment = comments(:appr_comment_on_editors_post)
    approved_comment.commentable_id = post.id
    post.comments << approved_comment

    unapproved_comment = comments(:unappr_comment_on_editors_post)
    unapproved_comment.commentable_id = post.id
    post.comments << unapproved_comment

    #When visitor visits the 'show' page for a given post
    visit post_path(post)

    #Then only the published post should be visible
    page.must_have_content approved_comment.content
    page.wont_have_content unapproved_comment.content
  end
end

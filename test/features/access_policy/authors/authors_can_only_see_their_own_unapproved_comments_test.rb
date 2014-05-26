require "test_helper"

feature "Author has certain capabilities" do
  scenario "As a Author, I can see unapproved comments on my own posts." do

    #Given that I am signed in as an author role,
    # and two comments are in the DB, one published, and
    # the other unpublished.
    sign_in(:author)
    post = posts(:authors_pub_post)
    approved_comment = comments(:appr_comment_on_authors_post)
    approved_comment.post_id = post.id
    post.comments << approved_comment
    unapproved_comment = comments(:unappr_comment_on_authors_post)
    unapproved_comment.post_id = post.id
    post.comments << unapproved_comment

    #When I visit the 'show' page for a given post
    visit post_path post

    #Then all comments should be visible
    page.must_have_content approved_comment.content
    page.must_have_content unapproved_comment.content
  end

  scenario "As a Author, I cannot see unapproved comments on other posts." do

    #Given that two comments are in the DB, one published, and
    # the other unpublished.
    sign_in(:author)
    post = posts(:editors_pub_post)
    approved_comment = comments(:appr_comment_on_editors_post)
    approved_comment.post_id = post.id
    post.comments << approved_comment
    unapproved_comment = comments(:unappr_comment_on_editors_post)
    unapproved_comment.post_id = post.id
    post.comments << unapproved_comment

    #When visitor visits the 'show' page for a given post
    visit post_path post

    #Then only the published post should be visible
    page.must_have_content approved_comment.content
    page.wont_have_content unapproved_comment.content
  end
end

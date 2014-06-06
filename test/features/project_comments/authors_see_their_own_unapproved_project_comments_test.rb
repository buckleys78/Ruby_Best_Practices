require "test_helper"

feature "Author has certain capabilities" do
  scenario "As a Author, I can see unapproved comments on my own projects." do

    #Given that I am signed in as an author role,
    # and two comments are in the DB, one published, and
    # the other unpublished.
    sign_in(:author)
    project = projects(:authors_pub_project)
    approved_comment = comments(:appr_comment_on_authors_project)
    approved_comment.commentable_id = project.id
    project.comments << approved_comment
    unapproved_comment = comments(:unappr_comment_on_authors_project)
    unapproved_comment.commentable_id = project.id
    project.comments << unapproved_comment

    #When I visit the 'show' page for a given project
    visit project_path project

    #Then all comments should be visible
    page.must_have_content approved_comment.content
    page.must_have_content unapproved_comment.content
  end

  scenario "As a Author, I cannot see unapproved comments on other projects." do

    #Given that two comments are in the DB, one published, and
    # the other unpublished.
    sign_in(:author)
    project = projects(:editors_pub_project)
    approved_comment = comments(:appr_comment_on_editors_project)
    approved_comment.commentable_id = project.id
    project.comments << approved_comment
    unapproved_comment = comments(:unappr_comment_on_editors_project)
    unapproved_comment.commentable_id = project.id
    project.comments << unapproved_comment

    #When visitor visits the 'show' page for a given project
    visit project_path project

    #Then only the approved comment should be visible
    page.must_have_content approved_comment.content
    page.wont_have_content unapproved_comment.content
  end
end

require "test_helper"

feature "Vistor has certain capabilities" do
  scenario "As a Visitor, I can only see approved comments." do

    #Given that two comments are in the DB, one published, and
    # the other unpublished.
    project = projects(:editors_pub_project)

    approved_comment = comments(:appr_comment_on_editors_project)
    approved_comment.project_id = project.id
    project.comments << approved_comment

    unapproved_comment = comments(:unappr_comment_on_editors_project)
    unapproved_comment.project_id = project.id
    project.comments << unapproved_comment

    #When visitor visits the 'show' page for a given post
    visit project_path(project)

    #Then only the published post should be visible
    page.must_have_content approved_comment.content
    page.wont_have_content unapproved_comment.content
  end
end

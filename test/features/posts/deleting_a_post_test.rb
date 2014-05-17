# require "test_helper"

# feature "Deleting A Post" do
#   scenario "clicking delete removes the record" do
#     # Given an existing post
#     sign_in
#     post = posts(:cr)
#     visit posts_path

#     # When I click delete
#     page.find('tr', :text => title).click_on "Destroy"

#     # Then the post is removed from the database.
#     page.wont_have_content "Code Rails"
#   end
# end

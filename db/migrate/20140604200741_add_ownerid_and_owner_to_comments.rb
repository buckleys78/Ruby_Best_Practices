class AddOwneridAndOwnerToComments < ActiveRecord::Migration
  def change
    add_column :comments, :owner_id, :integer
    add_column :comments, :owner, :string

    Comment.all.each do |c|
      c.owner_id = c.post_id
      c.owner = "Post"
    end

    remove_column :comments, :post_id, :integer
  end
end

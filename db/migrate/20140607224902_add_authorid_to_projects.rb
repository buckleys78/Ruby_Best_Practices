class AddAuthoridToProjects < ActiveRecord::Migration
  def up
    add_column :projects, :author_id, :string
  end

  def down
    remove_column :projects, :author_id
  end
end

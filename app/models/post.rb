class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments

  def publish!
    published = true
    save!
  end

  def authored_by? (user)
    author = user
  end
end

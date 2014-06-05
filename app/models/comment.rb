class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true     #modified

  validates :content, presence: true
  validates :author_email, presence: true
  validates :author, presence: true
end

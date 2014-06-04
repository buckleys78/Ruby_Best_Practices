class Project < ActiveRecord::Base
  belongs_to :author, class_name: "User"  #new
  has_many :comments, as :commentable      #new
  accepts_nested_attributes_for :comments #new
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true

end

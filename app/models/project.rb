class Project < ActiveRecord::Base
  belongs_to :author, class_name: "User"  #new
  has_many :comments, as: :commentable      #new
  accepts_nested_attributes_for :comments #new
  validates :name, length: { in: 4..255 }
  validates :technologies_used, presence: true

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

end

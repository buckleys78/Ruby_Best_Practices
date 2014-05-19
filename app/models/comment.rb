class Comment < ActiveRecord::Base
  belongs_to :post   #, class_name: "?????"  is this needed?

  def approve!
    approved = true
    save!
  end
end

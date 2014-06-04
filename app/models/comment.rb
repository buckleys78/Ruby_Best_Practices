class Comment < ActiveRecord::Base
  belongs_to :post, polymorphic: true     #modified
  belongs_to :project, polymorphic: true  #new
end

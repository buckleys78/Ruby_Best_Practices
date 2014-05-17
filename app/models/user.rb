class User < ActiveRecord::Base
  after_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, foreign_key: "author_id"

  def author?
    role == 'author'
  end

  def editor?
    role = 'editor'
  end

  def set_default_role
    if role.nil?
      role = 'author'
    end
  end
end

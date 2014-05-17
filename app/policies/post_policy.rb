class PostPolicy < Struct.new(:user, :post)

  def initialize(user, post)
    @user = user
    @post= post
  end

  def create?
    @user.present? && (@user.editor? || @user.author?)
  end

  def show?
    scope.where(:id => post.id).exists?
  end

  def update?
    @user.present? && (@user.editor? || @user.author?)
  end

  def edit?
    @user.present? && (@user.editor? || @user.author?)
  end

  def destroy?
    #binding.pry
    @user.present? && @user.editor?
  end

  def publish?
    @user.present? && @user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end
end

# class PostPolicy < Struct.new(:user, :post)

#   def edit

#   end

#   def publish?
#     user.editor?
#   end

#   def create?
#     user.present? && user.author? || user.editor?
#   end

#   class Scope < Struct.new(:user, :scope)

#     def resolve
#       if user.present? && user.editor?
#         scope.all
#       else
#         scope.where(published: true)
#       end
#     end

#    end
# end

class CommentPolicy < Struct.new(:user, :comment)

  def initialize(user, comment)
    @user = user
    @comment= comment
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
    @user.present? && (@user.editor? || @user.author?)
  end

  def approve?
    @user.present? && (@user.editor? || @user.author?)
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user.id)
      else
        scope.where(approved: true)
      end
    end
  end
end

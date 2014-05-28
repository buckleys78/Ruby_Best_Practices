class CommentPolicy < Struct.new(:user, :comment)

  def initialize(user, comment)
    @user = user
    @comment= comment
  end

  def create?
    # anyone can create.
  end

  def show?
    if @user.present? && @user.editor?
      true  # Editor: show all,
    elsif @user.present? && @user.author?
      #Author: all their own, only approved of others
      post = Post.find(@comment.post_id)
      post.author_id == @user.id || @comment.approved?
    else  #role == 'Visitor'
      @comment.approved?    # Visitor: only approved
    end
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

class ProjectPolicy

  def initialize(user, project)
    @user = user
    @project= project
  end

  def create?
    @user.present? && (@user.editor? || @user.author?)
  end

  def show?
    scope.where(id: project.id).exists?
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

  def publish?
    @user.present? && @user.editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(author_id: user.id)
      else
        scope.where(published: true)
      end
    end
  end
end

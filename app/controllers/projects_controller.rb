class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      # todo
    end if
  end

  def show
    @project = Project.find(project_params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end

class ProjectsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      format.html do
        if @project.save
          flash[:notice] = "Project has been created."
          redirect_to @project
        else
          flash.now[:error] = "Project could not be saved."
          render :new
        end
      end
      format.js do |format|
        @project.save
        # renders create view by default.
      end
    end
  end

  def show
    @commentable = @project
    @comment = @project.comments.build
  end

  def update
    @project.update_attributes(project_params)
    respond_to do |format|
      format.html do
        redirect_to @project, notice: 'Project was successfully updated.'
      end
      format.js {}
        # renders update view (update.js.erb) by default.
    end
  end

  def edit
  end

  def destroy
    @project.picture = nil
    @project.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Project was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used, :picture)
  end
end

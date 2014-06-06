class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :create, :new]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_commentable

  def index
    # @posts = policy_scope(Comment)
    @comments = policy_scope(Comment)
  end

  def show
    # @comments = Comment.find(params[:id])
    # @comment = @commentable.comments.find(comment_params)
  end

  def new
    @comment = @commentable.comments.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    # binding.pry
    # @comment = Comment.find(params[:id])
  end

  def create
    # @comment = @post.comments.new(comment_params)
    @comment = @commentable.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment is awaiting consideration.' }
        # format.json { render :show, status: :created, location: @comment }
      else
        instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
        format.html { render template: "#{@resource}/show" }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @comment= @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path, notice: 'Comment was successfully updated.' }
        # format.json { render :show, status: :ok, location: @comment}
      else
        format.html { render :edit }
        # format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #binding.pry
    @comment = @commentable.comments.find(params[:id])
    @commment.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Comment was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_comment
    @comment = @commentable.comments.find(comment_params)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content,
                                   (:approved if CommentPolicy.new(current_user, @comment).approve?),
                                    :author,
                                    :author_email,
                                    :referrer,
                                    :commentable_id)
  end

  def load_commentable
    @resource, id = request.path.split('/')[1,2]
    @commentable = @resource.singularize.classify.constantize.find(id)
  end

end

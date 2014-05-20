class CommentsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :load_post

  def index
    @posts = policy_scope(Comment)
  end

  def show
    @comments = Comment.find(params[:id])
    @comment = @post.comments.find(params[:id])
  end

  def new
    @comment = @post.comments.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@post, @comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # @comment= @post.comments.update(comment_params)
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_comment_path, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment}
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @commment.destroy
    respond_to do |format|
      format.html { redirect_to steps_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def load_post
    @post = Post.find(params(:post_id))
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content, :approved if PostPolicy.new(current_user, @comment).approve?))
  end

end

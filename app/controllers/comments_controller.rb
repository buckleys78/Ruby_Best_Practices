class CommentsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  #skip_before_action :verify_authenticity_token, only: :destroy
  # GET /comments
  # GET /comments.json
  def index
    @comments = policy_scope(Comment)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @Comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # Comment /comments
  # Comment /comments.json
  def create
    @Comment = Comment.new(comment_params)

    respond_to do |format|
      if @Comment.save
        current_user.comments << @Comment
        format.html { redirect_to @Comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @Comment }
      else
        format.html { render :new }
        format.json { render json: @Comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @Comment.update(post_params)
        format.html { redirect_to @Comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @Comment }
      else
        format.html { render :edit }
        format.json { render json: @Comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @Comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @Comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    #params.require(:Comment).permit(:title, :body,(:published if current_user.role == "editor"))
    #binding.pry
    params.require(:Comment).permit(:content,(:approved if CommentPolicy.new(current_user, @Comment).approve?))
  end
end
end

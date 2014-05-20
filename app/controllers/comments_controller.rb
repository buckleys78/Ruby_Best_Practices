class CommentsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Comment)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end


end

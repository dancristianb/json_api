class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_post_comment, only: [:show, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.new(comments_params)
    @comment.save
    render :show, status: :created
  end

  def show
    @comment
  end

  def update
    render :show if @comment.update(comments_params)
  end

  def destroy
    @comment.destroy
  end

  private

  def comments_params
    params.require(:comments).permit(:author, :text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_post_comment
    @comment = @post.comments.find(params[:id]) if @post
  end
end

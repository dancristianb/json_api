class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = @post.comments
  end

  def create
    @comment = @post.comments.new(comments_params)
    @comment.save
    render :show, status: :created
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  private

  def comments_params
    params.require(:comments).permit(:author, :text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end

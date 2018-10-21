class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    render :show, status: :created
  end

  def show
    puts @post
  end

  def update
    render :show if @post.update(post_params)
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:posts).permit(:title, :description, :active)
  end

end

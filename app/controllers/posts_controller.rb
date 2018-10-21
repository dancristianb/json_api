class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  # rails routes this to the show.json.jbuilder view by default
  # so three's no need to be verbose and call render :show
  def show
    @post = Post.find(params[:id])
    puts @post.inspect
  end

  def create
    @post = Post.create(post_params)
    render :show, status: :created
  end

  private

  def post_params
    params.require(:posts).permit(:title, :description, :active)
  end

end

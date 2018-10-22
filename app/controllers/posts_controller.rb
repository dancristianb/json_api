class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    # not needed as rails seems to handle this automatically
    # if post_params[:comments_attributes]
    #   @post.comments.create(post_params[:comments_attributes])
    # end
    render :show, status: :created
  end

  def show; end

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
    params.require(:posts).permit(:title, :description, :active,
                                  comments_attributes: %i[author text])
  end

end

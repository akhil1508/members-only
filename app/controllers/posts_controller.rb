class PostsController < ApplicationController
  before_filter :signed_in, only: [:new, :create]
  include SessionsHelper
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
      #That's fresh. A new post successfully created.
    else
      render 'index'
      #invalid
    end
  end

  def index
    @posts = Post.all
  end
  private
  def signed_in
    return true if cookies[:remember_token]
    return false
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end

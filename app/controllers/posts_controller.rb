class PostsController < ApplicationController
  layout 'standard'
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc).limit(5)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counters = 0

    if @post.save
      redirect_to user_posts_path, notice: 'Post created successfully'
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all if @post.comments.exists?
    @post.destroy
    redirect_to user_posts_path(user_id: current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

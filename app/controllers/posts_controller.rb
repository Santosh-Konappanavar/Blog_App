class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @current_user = current_user
  end
  
  def new
    @post = Post.new
  end

  def like
    @post = Post.find(params[:id])
    @like = Like.new(author_id: params[:user_id], post_id: @post.id)

    if @like.save
      redirect_to user_post_path(user_id: params[:user_id], id: params[:id]), notice: 'Like added successfully'
    else
      flash.now[:alert] = 'Failed to add like'
      render 'posts/show'
    end
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

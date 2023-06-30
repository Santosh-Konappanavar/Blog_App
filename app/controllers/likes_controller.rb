class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(author_id: current_user.id, post_id: @post.id)
    @user_id = params[:user_id]
    @like.save
    redirect_to user_post_path(user_id: @user_id, id: params[:id])
  end

  def destroy
    @post.likes.destroy_all if @post.likes.exists?
    @post.destroy
    redirect_to user_posts_path(user_id: current_user.id)
  end
end

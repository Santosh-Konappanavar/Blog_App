class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to user_post_path(user_id: params[:user_id], id: @post.id), notice: 'Like added successfully'
    else
      flash.now[:alert] = 'Failed to add like'
      render 'posts/show'
    end
  end
end

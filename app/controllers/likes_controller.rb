class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @like = Like.new(author_id: current_user.id, post_id: @post.id)
  
      if @like.save
        redirect_to user_post_path(user_id: params[:user_id], id: @post.id), notice: 'Like added successfully'
      else
        flash.now[:alert] = 'Failed to add like'
        render 'posts/show'
      end
    end
  end
  
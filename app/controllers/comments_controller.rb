class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @author_id = current_user.id
    @post_id = params[:post_id]
    @comment.author_id = @author_id
    @comment.post_id = @post_id

    if @comment.save
      redirect_to user_post_path(user_id: @author_id, id: @post_id), notice: 'Comment created successfully'
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(user_id: @comment.author_id, id: @comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

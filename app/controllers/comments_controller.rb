class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.author_id = current_user.id
    @comment.post_id = @post.id

    if @comment.save
      flash[:notice] = 'Comment was successfully created'
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, alert: 'Error occurred while creating the comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end

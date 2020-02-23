class CommentsController < ApplicationController
  before_action :find_post, only: [:create]
  before_action :set_comment, only: %i[destroy]
  def new 
    @comment = @post.comments.build
  end
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to root_path,success: 'Comment created'
    else
      redirect_to @post ,alert: 'Comment not created'
    end
  end

  def destroy
    @comment.destroy
    flash[:danger] = 'Comment was successfully deleted'
    redirect_to post_path
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id]) 
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end

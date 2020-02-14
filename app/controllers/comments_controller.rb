class CommentsController < ApplicationController
	before_action :find_post,only: [:create]

	def create
		@comment = @post.comments.new(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to root_path
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_post
		 @post = Post.find(params[:post_id])
	end
end

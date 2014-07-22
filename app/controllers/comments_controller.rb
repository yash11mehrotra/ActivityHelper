class CommentsController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		# @activity=@user.activities.find(params[:activity_id])
		@activity=Activity.find(params[:activity_id])
	end

	def create
		@user = User.find(params[:user_id])
		@activity=Activity.find(params[:activity_id])
		@comment=@activity.comments.new(acti_params)
		@comment.user_id = @user.id
		@comment.save
		redirect_to root_path
		# @activity=@user.activities.find(params[:activity_id])
		# @activity=@user.activities.find(params[:activity_id])
		# @activity.comments.create(acti_params)
	end

	def show
	end

	def acti_params
		params.require(:comment).permit(:commenter, :body)	
	end	
end

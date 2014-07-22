class HomeController < ApplicationController

	
  # @user= current_user
  # before_action :authenticate_user
  
  def homepage
 	
 	 @user= current_user
 	 
  	@activities = Activity.all(:order => "created_at DESC")
  	# @comments 	= Comment.all
  	# @activity1 =Activity.find(params[:activity_id])
  end

  def profile 
	    if user_signed_in? 
	  	@user= User.find(params[:user_id])
		else 
			redirect_to root_path
		end
  end

	
end

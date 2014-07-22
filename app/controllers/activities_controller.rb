	class ActivitiesController < ApplicationController
	respond_to :html, :json
	before_filter :authenticate_user!

	def new
		 @user = User.find(params[:user_id])
	end

	def create
		@user = User.find(params[:user_id])
		u= @user.activities.new(act_params)
		
		
		u.src=extract_video_id(u.src)
		u.save
		redirect_to root_path
 		
		 # u.src="https://www.youtube.com/embed/" + (u.src).split("v=")[1]
		 # u.src=YouTubeAddy.extract_video_id(u.src)
		
		# @user.activities.create(act_params)
		# @activity.title= params[:activity][:title]
	end	

	def show

	end	

	def act_params
		params.require(:activity).permit(:title, :description, :image, :src, :address, :latitude, :longitude)	
	end	


	def edit
		@activity= Activity.find(params[:id])
 	end

 	def update
 		@activity = Activity.find(params[:id])
 
       if @activity.update(act_params)
       # redirect_to root_path
       	respond_with do |format|
        		format.js do
        			render json: true
        		end
        		format.html do
        			redirect_to root_path
        		end
        end		

        else
    		render 'edit'
	   end
	end   

  # def youtube_embed_url(youtube_url, width = 420, height = 315)
  #   vid_id = extract_video_id(youtube_url)
  #   %(<iframe width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{vid_id}" frameborder="0" allowfullscreen></iframe>)
  # end

  # def youtube_regular_url(youtube_url)
  #   vid_id = extract_video_id(youtube_url)
  #   "http://www.youtube.com/watch?v=#{ vid_id }"
  # end

  # def youtube_shortened_url(youtube_url)
  #   vid_id = extract_video_id(youtube_url)
  #   "http://youtu.be/#{ vid_id }"
  # end



end

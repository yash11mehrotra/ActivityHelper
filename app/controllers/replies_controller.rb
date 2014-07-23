class RepliesController < ApplicationController
  def new

  end

  def create
  	@reply=Reply.new(check_params)
  	@reply.sender=current_user
  	@message=Message.find(params[:message_id])
  	@reply.message=@message
  	 if @message.sender== current_user
  	 		@reply.receiver=@message.receiver
  		 else 
  	 		@reply.receiver=@message.sender
  	 end
  	# @reply.receiver
  	# 
  	@reply.save
    
  	redirect_to messages_path(id:@reply.message_id)
  end

  def check_params
   	params.require(:reply).permit(:text)
   end
end

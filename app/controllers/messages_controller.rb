class MessagesController < ApplicationController
  def new
  	@user=User.find(params[:user_id])
  end

  def create
 	# @message=Message.new(check_params)
 	# @message.sender=current_user
 	# @message.receiver_id=params[:user_id]

 	# @message=current_user.messages_sent.new(check_params)
 	# @message.receiver_id=params[:user_id]

 	@receiver= User.find(params[:user_id])
 	@message=@receiver.messages_received.new(check_params)
 	@message.sender=current_user
 	@message.save

 	redirect_to root_path
  end

  def show

  	@msg= Message.all

  end

  def messages
  	
 	@msg= Message.all

  end

  private
   def check_params
   	params.require(:message).permit(:body)
   end 
end

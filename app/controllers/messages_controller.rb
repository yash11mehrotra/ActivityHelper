class MessagesController < ApplicationController
  def new
  	@user=User.find(params[:user_id])
  end

  def create
 	@message=Message.new(check_params)
 	@message.sender=current_user
 	@message.receiver_id=params[:user_id]

 	# @message=current_user.messages_sent.new(check_params)
 	# @message.receiver_id=params[:user_id]

 	# @receiver= User.find(params[:user_id])
 	# @message=@receiver.messages_received.new(check_params)
 	# @message.sender= current_user
 	@message.save

 	redirect_to root_path
  end

  def show

  	@msg= Message.all

  end

  def messages
	@msg= Message.all
  @messages = current_user.messages_received + current_user.messages_sent
  @messages.sort!{|x,y| x.created_at<=>y.created_at}
  # @a=params[:id]
  # raise @a.to_yaml
    if params[:id]
      @message = Message.find(params[:id])
        if @message.sender == current_user || @message.receiver == current_user
        @replies = @message.replies
        end
    end
  end

  private
   def check_params
   	params.require(:message).permit(:body,:subject)
   end 
end

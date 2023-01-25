class MessagesController < ApplicationController
  def create
    success, @message = Messages::CreateService.call current_user, message_params

    if !success
      @room = @message.room
      render 'rooms/show'
    end
  end

  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
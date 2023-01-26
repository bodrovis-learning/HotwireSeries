class MessagesController < ApplicationController
  def create
    success, @message = Messages::CreateService.call current_user, message_params

    if !success
      @room = @message.room
      render 'rooms/show'
    end
  end

  def show
    @message = Message.find_by id: params[:id]
    render partial: 'message', locals: { message: @message }
  end

  def update
    @message = Message.find_by id: params[:id]
    Messages::UpdateService.call @message
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
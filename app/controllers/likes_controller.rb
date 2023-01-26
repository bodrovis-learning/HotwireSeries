class LikesController < ApplicationController
  def create
    Likes::CreateService.call current_user, Message.find_by(id: params[:message_id])
  end

  def destroy
    Likes::DestroyService.call current_user, Message.find_by(id: params[:message_id])
  end
end
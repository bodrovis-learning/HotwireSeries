class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by id: params[:id]
    @message = @room.messages.build
  end
end
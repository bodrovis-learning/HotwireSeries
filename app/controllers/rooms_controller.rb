class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find_by id: params[:id]
    @message = Message.new room: @room
  end
end
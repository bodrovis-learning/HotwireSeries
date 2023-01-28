# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  extend Turbo::Streams::StreamName
  extend Turbo::Streams::Broadcasts
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    stream_name = verified_stream_name_from_params
    
    if subscription_allowed_to?(stream_name.to_s)
      stream_from stream_name
    else
      reject
    end
  end

  private

  def subscription_allowed_to?(stream_name)
    # Our streams are named "room_N" where N is the room ID
    # Extract the room ID:
    room_from_stream = stream_name.delete_prefix("room_")

    return false unless room_from_stream == params[:room_id]

    room = Room.find_by id: params[:room_id]

    current_user&.member_of?(room)
  end
end

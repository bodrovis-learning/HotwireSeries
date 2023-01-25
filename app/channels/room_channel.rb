class RoomChannel < ApplicationCable::Channel
  extend Turbo::Streams::Broadcasts, Turbo::Streams::StreamName
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    stream_name = verified_stream_name_from_params
    if stream_name.present? && subscription_allowed?
      stream_from stream_name
    else
      reject
    end
  end

  def subscription_allowed?
    puts params[:room_id].inspect
    puts current_user.inspect
    room = Room.find_by id: params[:room_id]
    current_user.present? && current_user.member_of?(room)
  end
end
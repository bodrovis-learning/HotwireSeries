# frozen_string_literal: true

class RoomChannel < ApplicationCable::Channel
  extend Turbo::Streams::StreamName
  extend Turbo::Streams::Broadcasts
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    stream_name = verified_stream_name_from_params
    # TODO: check that the stream name contains that same room_id as set in the params
    if stream_name.present? && subscription_allowed?
      stream_from stream_name
    else
      reject
    end
  end

  def subscription_allowed?
    room = Room.find_by id: params[:room_id]
    current_user&.member_of?(room)
  end
end

# frozen_string_literal: true

module Likes
  class DestroyService < ::ApplicationService
    def initialize(user, message)
      super
      @user = user
      @message = message
    end

    def call
      tx_and_commit do
        @object = Like.find_by user: @user, message: @message
        @object.destroy
      end

      super
    end

    private

    def post_call
      broadcast_later "room_#{@message.room.id}",
                      'likes/updated',
                      locals: { message: @message, initiator: @user.id }
    end
  end
end

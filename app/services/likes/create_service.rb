# frozen_string_literal: true

module Likes
  class CreateService < ::ApplicationService
    def initialize(user, message)
      super
      @user = user
      @message = message
    end

    def call
      tx_and_commit do
        @object = Like.new user: @user, message: @message
        @object.save
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

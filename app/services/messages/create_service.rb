# frozen_string_literal: true

module Messages
  class CreateService < ::ApplicationService
    def initialize(user, params)
      super
      @user = user
      @params = params
    end

    def call
      tx_and_commit do
        @object = @user.messages.build @params
        @object.save
      end

      super
    end

    private

    def post_call
      broadcast_later "room_#{@object.room.id}",
                      'messages/created',
                      locals: { message: @object }
    end
  end
end

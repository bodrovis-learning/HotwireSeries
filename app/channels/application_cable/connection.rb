# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user&.name
      puts "===="
      puts current_user.inspect
    end

    protected

    def find_verified_user
      #verified_user = env['warden'].user
      User.find_by id: cookies[:user_id]
    end
  end
end

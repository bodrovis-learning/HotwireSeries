# frozen_string_literal: true

class RoomMember < ApplicationRecord
  belongs_to :room
  belongs_to :user
end

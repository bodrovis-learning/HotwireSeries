# frozen_string_literal: true

class User < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :room_members, dependent: :destroy
  has_many :rooms, through: :room_members
  has_many :messages, dependent: :destroy

  def admin?
    true
  end

  def member_of?(room)
    room.users.include?(self)
  end
end

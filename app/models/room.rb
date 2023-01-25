class Room < ApplicationRecord
  has_many :room_members, dependent: :destroy
  has_many :users, through: :room_members
  has_many :messages, dependent: :destroy
end

class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :body, presence: true
end

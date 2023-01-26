# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, class_name: 'User'

  validates :body, presence: true
end

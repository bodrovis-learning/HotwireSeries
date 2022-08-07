# frozen_string_literal: true

class Folder < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :bookmarks, dependent: :destroy
end

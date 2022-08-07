# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :folder

  validates :title, presence: true
  validates :url, presence: true
end

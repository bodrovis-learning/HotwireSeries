# frozen_string_literal: true

class Folder < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
end

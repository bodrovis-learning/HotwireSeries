# frozen_string_literal: true

class User < ApplicationRecord
  has_many :notes, dependent: :destroy

  def admin?
    true
  end
end

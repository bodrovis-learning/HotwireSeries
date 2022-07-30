class User < ApplicationRecord
  has_many :notes, dependent: :destroy
end

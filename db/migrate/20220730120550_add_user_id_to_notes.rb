# frozen_string_literal: true

class AddUserIdToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :user, null: false, foreign_key: true
  end
end

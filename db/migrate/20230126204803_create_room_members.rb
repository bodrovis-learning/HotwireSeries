# frozen_string_literal: true

class CreateRoomMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :room_members do |t|
      t.belongs_to :room, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :room_members, %i[room_id user_id], unique: true
  end
end

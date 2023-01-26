# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :message, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, %i[user_id message_id], unique: true
  end
end

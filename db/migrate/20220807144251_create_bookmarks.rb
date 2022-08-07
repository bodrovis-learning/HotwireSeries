# frozen_string_literal: true

class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.belongs_to :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end

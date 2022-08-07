# frozen_string_literal: true

class AddPositionToNotes < ActiveRecord::Migration[7.0]
  def up
    add_column :notes, :position, :integer, null: false, default: 1
    execute <<~SQL.squish
      alter table notes add constraint unique_user_id_position unique (user_id, position) deferrable initially deferred;
    SQL
  end

  def down
    execute <<~SQL.squish
      alter table notes drop constraint unique_user_id_position
    SQL
    remove_column :notes, :position, :integer, null: false, default: 1
  end
end

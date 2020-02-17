class RemoveColumnPhotographerId < ActiveRecord::Migration[6.0]
    change_table :photographers do |t|
      t.remove :photo_id
    end
  end
  
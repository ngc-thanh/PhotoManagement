class CreatePhotographer < ActiveRecord::Migration[6.0]
  def change
    create_table :photographers do |t|
      t.integer :photo_id
      t.string :name

      t.timestamps
    end
  end
end

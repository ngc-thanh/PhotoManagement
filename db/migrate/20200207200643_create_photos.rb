class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :permission_id
      t.date    :shooting_date
      t.date    :upload_date
      t.date    :download_date
      t.date    :delete_date
      t.string  :content
      t.string  :photographer
      
      t.timestamps
    end
  end
end

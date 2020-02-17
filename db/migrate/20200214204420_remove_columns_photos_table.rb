class RemoveColumnsPhotosTable < ActiveRecord::Migration[6.0]
  change_table :photos do |t|
    t.remove :upload_date, :photographer, :content
    t.rename :permission_id, :photographer_id
  end
end

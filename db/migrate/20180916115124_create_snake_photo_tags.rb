class CreateSnakePhotoTags < ActiveRecord::Migration[5.2]
  def change
    create_table :snake_photo_tags do |t|
      t.boolean :head_lateral_left, null: true, default: 0
      t.boolean :head_lateral_right, null: true, default: 0
      t.boolean :rostral, null: true, default: 0
      t.boolean :head_dorsal, null: true, default: 0
      t.boolean :hood_dorsal, null: true, default: 0
      t.boolean :full_body, null: true, default: 0
      t.boolean :subcaudals, null: true, default: 0
      t.references :active_storage_attachment
      t.timestamps
    end
  end
end

class CreateSnakeCharms < ActiveRecord::Migration[5.2]
  def change
    create_table :snake_charms do |t|
      t.datetime :rescue_date_time, null: false
      t.string :address, null: false
      t.string :village, null: false
      t.string :pincode, null: false
      t.string :country, null: false
      t.string :caller_name, null: false
      t.integer :caller_phone, null: false
      t.float :snake_length, null: false
      t.string :snake_length_unit, null: false
      t.float :snake_weight, null: false
      t.string :snake_weight_unit, null: false
      t.string :snake_sex, null: false
      t.string :snake_color, null: false
      t.integer :snake_divided_sub_caudals
      t.integer :snake_undivided_sub_caudals
      t.string :snake_behavior, null: false
      t.string :snake_macro_habitat, null: false
      t.string :snake_micro_habitat, null: false
      t.string :snake_condition, null: false
      t.datetime :release_date
      t.references :user
      t.timestamps
    end
  end
end

class AddAdditonalFields < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :town, :string, null: false
    add_column :snake_charms, :nature_of_sighting, :string, null: false
  end
end

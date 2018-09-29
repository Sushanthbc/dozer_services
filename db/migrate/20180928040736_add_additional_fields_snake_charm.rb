class AddAdditionalFieldsSnakeCharm < ActiveRecord::Migration[5.2]
  def change
    add_column :snake_charms, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :snake_charms, :longitude, :decimal, {:precision=>10, :scale=>6}
    add_column :snake_charms, :elevation, :decimal
    add_column :snake_charms, :elevation_unit, :string
    add_column :snake_charms, :general_remarks, :string
    add_column :snake_charms, :bite_report, :string
  end
end

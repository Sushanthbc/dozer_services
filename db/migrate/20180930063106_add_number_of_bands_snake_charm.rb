class AddNumberOfBandsSnakeCharm < ActiveRecord::Migration[5.2]
  def change
    add_column :snake_charms, :number_of_bands, :string, null: true
  end
end

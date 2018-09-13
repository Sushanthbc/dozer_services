class DeleteModifyCaudalsSnakeCharm < ActiveRecord::Migration[5.2]
  def change
    remove_column :snake_charms, :snake_divided_sub_caudals
    remove_column :snake_charms, :snake_undivided_sub_caudals
    add_column :snake_charms, :snake_caudals, :string
  end
end

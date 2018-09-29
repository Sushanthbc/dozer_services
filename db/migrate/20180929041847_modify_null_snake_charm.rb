class ModifyNullSnakeCharm < ActiveRecord::Migration[5.2]
  def change
    change_column_null :snake_charms, :rescue_date_time, true
    change_column_null :snake_charms, :country, true
    change_column_null :snake_charms, :snake_weight, true
    change_column_null :snake_charms, :snake_weight_unit, true
    change_column_null :snake_charms, :snake_sex, true
    change_column_null :snake_charms, :snake_color, true
    change_column_null :snake_charms, :snake_caudals, true
    change_column_null :snake_charms, :snake_behavior, true
    change_column_null :snake_charms, :snake_micro_habitat, true
    change_column_null :snake_charms, :snake_macro_habitat, true
    change_column_null :snake_charms, :snake_condition, true
  end
end

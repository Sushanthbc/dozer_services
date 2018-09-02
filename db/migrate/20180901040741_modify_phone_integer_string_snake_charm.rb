class ModifyPhoneIntegerStringSnakeCharm < ActiveRecord::Migration[5.2]
  def change
    change_column :snake_charms, :caller_phone, :string
  end
end

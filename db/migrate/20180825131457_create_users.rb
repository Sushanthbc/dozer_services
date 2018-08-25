class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email_id, null: false
      t.string :phone, null: false
      t.string :admin, null: false
      t.timestamps
    end
  end
end

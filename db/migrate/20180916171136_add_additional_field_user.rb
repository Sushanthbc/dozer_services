class AddAdditionalFieldUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :about_user, :string
    add_column :users, :purpose, :string
    if Rails.env.production?
      change_column :users, :admin, 'boolean USING CAST(column_name AS boolean)',
       default: 0
    else
     change_column :users, :admin, :boolean, default: 0
    end
  end
end

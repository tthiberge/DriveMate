class AddColumnsDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gearbox, :string
    add_column :users, :car_owner, :boolean
    add_column :users, :car_owner_info, :string
    add_column :users, :driving_licence, :boolean
    add_column :users, :driving_licence_info, :string
  end
end

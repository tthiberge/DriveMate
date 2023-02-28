class AddDateToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :date, :date
  end
end

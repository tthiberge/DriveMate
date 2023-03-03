class ChangeCoordinatesOnRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :arrival_latitude, :float
    add_column :rides, :arrival_longitude, :float
  end
end

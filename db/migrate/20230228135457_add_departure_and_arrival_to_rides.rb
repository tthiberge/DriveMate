class AddDepartureAndArrivalToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :departure_location, :string
    add_column :rides, :arrival_location, :string
  end
end

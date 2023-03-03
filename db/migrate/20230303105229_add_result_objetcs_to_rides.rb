class AddResultObjetcsToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :departure_results, :string
    add_column :rides, :arrival_results, :string
  end
end

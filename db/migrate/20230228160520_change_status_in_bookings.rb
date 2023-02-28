class ChangeStatusInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :status, :string, 'Pending'
  end
end

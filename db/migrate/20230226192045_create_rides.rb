class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :car_type
      t.boolean :owner_presence
      t.integer :seats_available
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

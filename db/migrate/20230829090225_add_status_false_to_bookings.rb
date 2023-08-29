class AddStatusFalseToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :status, :boolean
    add_column :bookings, :status, :boolean, default: false
  end
end

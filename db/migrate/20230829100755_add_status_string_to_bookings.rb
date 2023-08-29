class AddStatusStringToBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :status, :boolean, default: false
    add_column :bookings, :status, :string
  end
end

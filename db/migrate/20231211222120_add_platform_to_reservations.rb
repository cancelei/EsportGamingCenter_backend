class AddPlatformToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :platform, :string
  end
end

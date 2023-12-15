class AddGameIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :game_id, :integer
  end
end

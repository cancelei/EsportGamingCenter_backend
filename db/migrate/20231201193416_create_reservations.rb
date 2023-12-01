class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_date
      t.string :setup_config
      t.string :status

      t.timestamps
    end
  end
end

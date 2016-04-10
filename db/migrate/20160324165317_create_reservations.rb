class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :code
      t.date :started_at
      t.date :ended_at
      t.time :started_time
      t.time :ended_time
      t.references :user, index: true, foreign_key: true
      t.references :car_park, index: true, foreign_key: true
      t.references :reservation_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateCarParks < ActiveRecord::Migration
  def change
    create_table :car_parks do |t|
      t.string :address
      t.float :price
      t.string :url_image
      t.string :description
      t.boolean :state
      t.date :started_at
      t.date :ended_at
      t.time :started_time
      t.time :ended_time
      t.references :user, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.references :reservation_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

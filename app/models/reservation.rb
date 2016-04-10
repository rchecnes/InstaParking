class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :car_parks
  belongs_to :reservation_types
end

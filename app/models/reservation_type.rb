class ReservationType < ActiveRecord::Base
    has_many :reservations
    has_many :car_parks
end

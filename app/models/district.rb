class District < ActiveRecord::Base
    has_many :car_parks
    has_many :favorites
end

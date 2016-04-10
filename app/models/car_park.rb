class CarPark < ActiveRecord::Base
  belongs_to :user
  belongs_to :district
  belongs_to :reservation_type
  has_many :reservations
  
  #validacion
  validates :address ,presence: true
  validates :price ,presence: true
  validates :user ,presence: true
  validates :district ,presence: true
  validates :started_at ,presence: true
  validates :ended_at ,presence: true
  validates :started_time ,presence: true
  validates :ended_time ,presence: true
  validates :reservation_type ,presence: true
  validates :state ,presence: true
end

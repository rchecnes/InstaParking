class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :district
  
    #validacion
    validates :name ,presence: true
    validates :user ,presence: true
    validates :district ,presence: true
  
end

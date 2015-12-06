class Rateable < ActiveRecord::Base
  belongs_to :rate, polymorphic: true
  belongs_to :rating

end

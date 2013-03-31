class Place < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :current_rating, :title, :subtitle, :description , :images,:foodtype, :foursquare_venue, :latitude, :longitude
  has_many :items
  serialize :foodtype
  
end

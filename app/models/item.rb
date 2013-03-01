class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :source
  serialize :foodtype
  attr_accessible :link
  attr_accessible :rating
  serialize :description
  serialize :descriptionHTML
  attr_accessible :latitude
  attr_accessible :longitude
  attr_accessible :titlefull
  attr_accessible :title
  attr_accessible :location
  attr_accessible :is_post
  attr_accessible :foursquare_venue  
  attr_accessible :fs_match_count
  attr_accessible :subtitle
  serialize :images
end

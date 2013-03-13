class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  serialize :description
#  serialize :descriptionHTML
  serialize :images
  serialize :mid_res_images  
  serialize :low_res_images  
  serialize :foodtype
  
  attr_accessible :source
  attr_accessible :link
  attr_accessible :rating
  
  attr_accessible :latitude
  attr_accessible :longitude
  attr_accessible :titlefull
  attr_accessible :title
  attr_accessible :location
  attr_accessible :is_post
  attr_accessible :foursquare_venue  
  attr_accessible :fs_match_count
  attr_accessible :subtitle
end

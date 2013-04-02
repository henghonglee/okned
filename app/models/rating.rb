class Rating < ActiveRecord::Base
  attr_accessible :score , :place_id , :user_id
  belongs_to :place
end

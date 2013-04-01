class RatingsController < ApplicationController
  
  def allRatings
    @foundItems = Rating.all
    render :json => @foundItems, :content_type => 'text/json'
  end
  
  def getRatings
    @foundItems = Rating.where("created_at >= :date OR updated_at >= :date", date: params[:id])
    render :json => @foundItems , :content_type => 'text/json'
  end
  
  
  def index
  end
  
  def create
    @createdRating = Rating.new(params[:rating])
    @rated_place = Place.find(params[:rating][:place_id])
    @rated_place.ratings << @createdRating
    @createdRating.save
    totalrating = 0 
    for rating in @rated_place.ratings
      totalrating= totalrating + rating.score
    end
    @rated_place.current_rating = totalrating/@rated_place.ratings.count
    @rated_place.save
    render :json => @rated_place , :content_type => 'text/json'
  end
  
  def show
  end
  
  def new
    
    
  end
  
  def update
  end
  
  def destroy
  end
  
  def edit
  end
end

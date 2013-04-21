class PlacesController < ApplicationController
  
    def update
      @placeToEdit = Place.find(params[:id])
      @placeToEdit.update_attributes(params[:place])
      if @placeToEdit.save
        Rails.cache.clear
        render :json => {:status=>201 , :success=>true}
      else
        render :json => {:status => 404 , :success=>false}
      end
    end

end

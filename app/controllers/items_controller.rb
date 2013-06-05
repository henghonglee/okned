# EN-TAG test tag
class ItemsController < ApplicationController
  caches_action :getIEATISHOOTIPOST
  caches_action :getLOVESGFOOD
  caches_action :getSGFOODONFOOD
  caches_action :getLADYIRONCHEF
  caches_action :getDANIELFOODDIARY
  
  def index
    render :json => current_user
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
    @itemToEdit = Item.find(params[:id])
    @itemToEdit.update_attributes(params[:item])
    if @itemToEdit.save
      Rails.cache.clear
      render :json => {:status=>201 , :success=>true}
    else
      render :json => {:status => 404 , :success=>false}
    end
  end

  def destroy
  end
  
  
  def allFoodPlace
    @foundItems = Place.all
    render :json => @foundItems, :content_type => 'text/json'
  end
  def allIEATISHOOTIPOST  
    @foundItems = Item.where("source = 'IEATISHOOTIPOST'")
    render :json => @foundItems, :content_type => 'text/json'
  end
  def allLOVESGFOOD  
    @foundItems = Item.where("source = 'LOVE SG FOOD'")
    render :json => @foundItems, :content_type => 'text/json'
  end
  def allSGFOODONFOOT  
    @foundItems = Item.where("source = 'SGFOODONFOOT'")
    render :json => @foundItems, :content_type => 'text/json'
  end
  def allLADYIRONCHEF  
    @foundItems = Item.where("source = 'LADY IRON CHEF'")
    render :json => @foundItems, :content_type => 'text/json'
  end
  def allDANIELFOODDIARY  
    @foundItems = Item.where("source = 'DANIEL FOOD DIARY'")
    render :json => @foundItems, :content_type => 'text/json'
  end


  def getFoodPlace
    @foundItems = Place.where("created_at >= :date OR updated_at >= :date", date: params[:id])
    render :json => @foundItems , :content_type => 'text/json'
  end
  def getIEATISHOOTIPOST
    @foundItems = Item.where("source = 'IEATISHOOTIPOST' AND created_at >= :date OR updated_at >= :date", date: params[:id])
    render :json => @foundItems , :content_type => 'text/json'
  end
  def getLOVESGFOOD
    @foundItems = Item.where("source = 'LOVE SG FOOD' AND created_at >= :date OR updated_at >= :date", date: params[:id])
    render :json => @foundItems , :content_type => 'text/json'
  end
  def getSGFOODONFOOT
    @foundItems = Item.where("source = 'SGFOODONFOOT' AND created_at >= :date OR updated_at >= :date", date: params[:id])    
    render :json => @foundItems,:except => :descriptionHTML , :content_type => 'text/json'
  end
  def getLADYIRONCHEF
    @foundItems = Item.where("source = 'LADY IRON CHEF' AND created_at >= :date OR updated_at >= :date", date: params[:id])        
    render :json => @foundItems , :content_type => 'text/json'
  end
  def getDANIELFOODDIARY
    @foundItems = Item.where("source = 'DANIEL FOOD DIARY' AND created_at >= :date OR updated_at >= :date", date: params[:id])        
    render :json => @foundItems , :content_type => 'text/json'
  end
end

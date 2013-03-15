class ItemsController < ApplicationController
  caches_action :getIEATISHOOTIPOST
  caches_action :getLOVESGFOOD
  caches_action :getSGFOODONFOOD
  caches_action :getLADYIRONCHEF
  caches_action :getDANIELFOODDIARY
  
  def index
    @foundItems = Item.find_all_by_source(params[:source])
    # @all_items = Item.all
    render :json => @foundItems
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
#    @itemToEdit.update_attributes(params[:item])
    @itemToEdit.images.delete_at(params[:delete].to_i)
    @itemToEdit.low_res_images.delete_at(params[:delete].to_i)    
    if @itemToEdit.save
      render :json => {:status=>201 , :success=>true}
    else
      render :json => {:status => 404 , :success=>false}
    end
  end

  def destroy
  end
  
  def getIEATISHOOTIPOST
    @foundItems = Item.find_all_by_source("IEATISHOOTIPOST")
    render :json => @foundItems ,:except=>"descriptionHTML", :content_type => 'text/json'
  end
  def getLOVESGFOOD
    @foundItems = Item.find_all_by_source("LOVE SG FOOD")
    render :json => @foundItems ,:except=>"descriptionHTML", :content_type => 'text/json'
  end
  def getSGFOODONFOOT
    @foundItems = Item.find_all_by_source("SGFOODONFOOT")
    render :json => @foundItems ,:except=>"descriptionHTML", :content_type => 'text/json'
  end
  def getLADYIRONCHEF
    @foundItems = Item.find_all_by_source("LADYIRONCHEF")
    render :json => @foundItems ,:except=>"descriptionHTML", :content_type => 'text/json'
  end
  def getDANIELFOODDIARY
    @foundItems = Item.find_all_by_source("DANIEL FOOD DIARY")
    render :json => @foundItems ,:except=>"descriptionHTML", :content_type => 'text/json'
  end
end

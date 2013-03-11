class ItemsController < ApplicationController
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
end

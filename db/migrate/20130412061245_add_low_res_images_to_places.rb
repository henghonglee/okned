class AddLowResImagesToPlaces < ActiveRecord::Migration
  def change
    add_column :places , :low_res_images , :text    
  end
end

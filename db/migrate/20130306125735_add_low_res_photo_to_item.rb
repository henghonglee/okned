class AddLowResPhotoToItem < ActiveRecord::Migration
  def change
     add_column :items, :low_res_images, :text
     remove_column  :items, :fs_match_count
  end
end

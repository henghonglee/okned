class AddMidRes < ActiveRecord::Migration
  def up
     add_column :items, :mid_res_images, :text
  end

  def down
     remove_column :items, :mid_res_images
  end
end

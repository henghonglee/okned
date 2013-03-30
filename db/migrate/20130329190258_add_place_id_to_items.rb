class AddPlaceIdToItems < ActiveRecord::Migration
  def change
    add_column :items , :place_id , :int
  end
end

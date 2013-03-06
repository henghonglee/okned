class AddFlagToItem < ActiveRecord::Migration
  def change
    add_column :items, :flagged, :boolean , :default=>false    
  end
end

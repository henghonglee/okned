class AddFoursqureVenueToItems < ActiveRecord::Migration
  def change
    add_column :items, :foursqure_venue, :string
  end
end

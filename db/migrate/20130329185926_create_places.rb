class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.float :current_rating
      t.string :title
      t.string :subtitle
      t.string :description
      t.text :images
      t.text :foodtype
      t.string :foursquare_venue
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
  end
end

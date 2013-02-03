class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :source
      t.text :foodtype
      t.string :link
      t.string :rating
      t.text :description
      t.text :descriptionHTML
      t.float :latitude
      t.float :longitude
      t.string :titlefull
      t.string :subtitle
      t.text :images
      t.timestamps
    end
  end
end

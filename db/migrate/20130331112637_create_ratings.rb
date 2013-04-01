class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :place_id
      t.integer :user_id
      t.timestamps
    end
  end
end

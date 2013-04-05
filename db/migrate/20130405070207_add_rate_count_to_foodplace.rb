class AddRateCountToFoodplace < ActiveRecord::Migration
  def change
    add_column :places , :rate_count , :int
  end
end

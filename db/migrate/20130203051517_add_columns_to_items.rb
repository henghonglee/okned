class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :location, :string
    add_column :items, :title, :string
  end
end

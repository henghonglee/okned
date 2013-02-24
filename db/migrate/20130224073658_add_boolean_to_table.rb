class AddBooleanToTable < ActiveRecord::Migration
  def change
    add_column :items, :is_post, :boolean , :default=>true
  end
end

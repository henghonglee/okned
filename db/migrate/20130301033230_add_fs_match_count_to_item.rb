class AddFsMatchCountToItem < ActiveRecord::Migration
  def change
    add_column :items, :fs_match_count, :int
  end
end

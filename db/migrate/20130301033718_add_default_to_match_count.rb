class AddDefaultToMatchCount < ActiveRecord::Migration
  def change
    change_column :items, :fs_match_count, :int, :default => 0
  end
end

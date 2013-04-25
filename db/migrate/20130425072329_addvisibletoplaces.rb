class Addvisibletoplaces < ActiveRecord::Migration
  def up
    add_column :places , :is_visible , :boolean, :default => true
  end

  def down
    remove_column :places , :is_visible , :boolean, :default => true
  end
end

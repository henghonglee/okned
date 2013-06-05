class AddClassifiedToItems < ActiveRecord::Migration
  def change
    add_column :items , :classified , :text
    add_column :items , :train , :string    
  end
end

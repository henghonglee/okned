class AddFirstNameToUser < ActiveRecord::Migration
  def change
    add_column :users , :first_name , :string
    add_column :users , :fb_access_token , :string
        
  end
end

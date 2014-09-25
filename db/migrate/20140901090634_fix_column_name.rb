class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :users, :password, :hash_password
  	remove_column :users , :confirm_password
  end

  def down
  end
end

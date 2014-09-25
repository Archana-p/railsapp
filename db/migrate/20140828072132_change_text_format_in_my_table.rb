class ChangeTextFormatInMyTable < ActiveRecord::Migration
  def up
  	 change_column :articles, :description, :text
  end

  def down
  	change_column :articles, :description, :string
  end
end

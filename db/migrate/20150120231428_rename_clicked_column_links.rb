class RenameClickedColumnLinks < ActiveRecord::Migration
  def change
  	rename_column :links, :clicked, :clicks
  end
end

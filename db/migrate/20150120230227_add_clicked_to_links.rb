class AddClickedToLinks < ActiveRecord::Migration
  def change
  	change_table :links do |t|
      t.integer :clicked, default: 0
    end
  end
end

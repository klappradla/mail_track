class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :recipient
      t.integer :opened, default: 0

      t.timestamps null: false
    end
  end
end

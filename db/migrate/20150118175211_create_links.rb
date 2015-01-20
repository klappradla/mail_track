class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.references :email, index: true

      t.timestamps null: false
    end
    add_foreign_key :links, :emails
  end
end

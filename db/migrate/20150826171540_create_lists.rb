class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|

      t.string :ip
      t.string :category
      t.string :user_name
      t.string :phone_number
      t.string :mac_address
      t.string :location
      t.text :description
      t.integer :user_id
      t.string :user_ip

      t.timestamps null: false
    end
  end
end

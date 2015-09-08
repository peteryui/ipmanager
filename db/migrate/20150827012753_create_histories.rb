class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|

      t.string :ip
      t.string :category
      t.string :user_name
      t.string :phone_number
      t.string :mac_address
      t.string :location
      t.text :description

      t.string :user_id

      t.date :created_on
      t.date :updated_on

      t.timestamps null: false
    end
  end
end

class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
        t.string :card_id
        t.string :address_line_1
        t.string :address_line_2
        t.string :city
        t.string :state_abbr
        t.integer :zip_code
        t.timestamps null:false
    end
  end
end

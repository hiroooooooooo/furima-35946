class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city_name, null: false
      t.string :house_num, null: false
      t.string :building_name
      t.string :phone_num, null: false
      t.references :buyer, foreign_key: true

      t.timestamps
    end
  end
end

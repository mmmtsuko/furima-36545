class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :private,          null: false
      t.string     :postal_code,      null: false
      t.integer    :prefecture_id,    null: false
      t.string     :city_name,        null: false
      t.string     :house_number_id,  null: false
      t.string     :building_name
      t.string     :phone_number,     null: false
      t.timestamps 
    end
  end
end

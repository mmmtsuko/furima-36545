class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :users, foreign_key: true
      t.references :items, goreign_key: true
      t.timestamps
    end
  end
end

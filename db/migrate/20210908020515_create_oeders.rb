class CreateOeders < ActiveRecord::Migration[6.0]
  def change
    create_table :oeders do |t|

      t.timestamps
    end
  end
end

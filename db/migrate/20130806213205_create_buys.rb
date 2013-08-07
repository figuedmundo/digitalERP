class CreateBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.integer :supplier_id
      t.integer :product_id
      t.integer :amount
      t.float :price
      t.float :total

      t.timestamps
    end
    add_index  :buys, :product_id
    add_index  :buys, :supplier_id
  end
end

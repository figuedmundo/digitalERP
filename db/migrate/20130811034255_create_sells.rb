class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.integer :customer_id
      t.integer :product_id
      t.integer :amount
      t.float :price
      t.float :total

      t.timestamps
    end
    add_index  :sells, :product_id
    add_index  :sells, :customer_id
  end
end

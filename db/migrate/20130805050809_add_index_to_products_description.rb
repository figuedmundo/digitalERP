class AddIndexToProductsDescription < ActiveRecord::Migration
  def change
    add_index :products, :description, unique: true
  end
end

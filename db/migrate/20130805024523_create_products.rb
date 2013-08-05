class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.integer :total
      t.float :price

      t.timestamps
    end
  end
end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :nit
      t.string :city
      t.string :address
      t.integer :phone
      t.integer :cellphone

      t.timestamps
    end
    add_index :customers, :nit, unique: true
  end
end

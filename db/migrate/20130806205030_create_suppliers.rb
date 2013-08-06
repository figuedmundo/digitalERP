class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :city
      t.string :address
      t.integer :phone
      t.integer :cellphone

      t.timestamps
    end
  end
end

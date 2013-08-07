class AddNameToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :name, :string
    remove_column :suppliers, :first_name
    remove_column :suppliers, :last_name
  end
end

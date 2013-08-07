class RemoveIndexDescriptionFromProducts < ActiveRecord::Migration
  def up
    remove_index :products, :description
  end

  def down
    add_index :products, :description, unique: true
  end
end

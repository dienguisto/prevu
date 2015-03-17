class AddOwnerTypeAndRemoveTelephone1FromContact < ActiveRecord::Migration
  def change
    add_column :contacts, :owner_type, :string
    remove_column :contacts, :telephone1, :string
  end
end

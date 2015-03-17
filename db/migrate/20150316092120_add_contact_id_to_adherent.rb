class AddContactIdToAdherent < ActiveRecord::Migration
  def change
    add_column :adherents, :contact_id, :integer
  end
end

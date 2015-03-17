class RemoveAdresseFromAdherent < ActiveRecord::Migration
  def change
    remove_column :adherents, :adresse, :string
  end
end

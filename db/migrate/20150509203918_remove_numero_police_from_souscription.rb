class RemoveNumeroPoliceFromSouscription < ActiveRecord::Migration
  def change
    remove_column :souscriptions, :numero_police, :string
  end
end

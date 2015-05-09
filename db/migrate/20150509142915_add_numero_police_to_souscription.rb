class AddNumeroPoliceToSouscription < ActiveRecord::Migration
  def change
    add_column :souscriptions, :numero_police, :string
  end
end

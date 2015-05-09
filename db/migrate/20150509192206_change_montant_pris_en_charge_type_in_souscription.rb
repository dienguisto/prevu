class ChangeMontantPrisEnChargeTypeInSouscription < ActiveRecord::Migration
  def change
    change_column :ordonnances, :montant_pris_en_charge, :float, null: true
  end
end

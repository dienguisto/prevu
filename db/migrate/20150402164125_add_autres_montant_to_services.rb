class AddAutresMontantToServices < ActiveRecord::Migration
  def change
    add_column :ordonnances, :montant_pris_en_charge, :float, null: false
    add_column :ordonnances, :montant_paye_par_adherent, :float, null: false
    add_column :consultations, :montant_pris_en_charge, :float, null: false
    add_column :consultations, :montant_paye_par_adherent, :float, null: false
  end
end

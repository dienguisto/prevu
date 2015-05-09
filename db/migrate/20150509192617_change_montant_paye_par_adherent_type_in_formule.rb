class ChangeMontantPayeParAdherentTypeInFormule < ActiveRecord::Migration
  def change
    change_column :ordonnances, :montant_paye_par_adherent, :float, null: true
  end
end

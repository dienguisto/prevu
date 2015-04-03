class RenameMontantToMontantTotalToConsultation < ActiveRecord::Migration
  def change
    rename_column :consultations, :montant, :montant_total
  end
end

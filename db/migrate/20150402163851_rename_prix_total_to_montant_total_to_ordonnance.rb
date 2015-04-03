class RenamePrixTotalToMontantTotalToOrdonnance < ActiveRecord::Migration
  def change
    rename_column :ordonnances, :prix_total, :montant_total
  end
end

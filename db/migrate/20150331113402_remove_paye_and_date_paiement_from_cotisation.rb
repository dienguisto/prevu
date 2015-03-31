class RemovePayeAndDatePaiementFromCotisation < ActiveRecord::Migration
  def change
    remove_column :cotisations, :paye, :boolean
    remove_column :cotisations, :date_paiement, :datetime
  end
end

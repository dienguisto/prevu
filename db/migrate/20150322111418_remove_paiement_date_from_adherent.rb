class RemovePaiementDateFromAdherent < ActiveRecord::Migration
  def change
    remove_column :adherents, :paiement_date, :datetime
  end
end

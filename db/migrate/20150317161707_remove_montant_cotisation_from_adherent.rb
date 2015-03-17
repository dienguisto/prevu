class RemoveMontantCotisationFromAdherent < ActiveRecord::Migration
  def change
    remove_column :adherents, :montant_cotisation, :float
  end
end

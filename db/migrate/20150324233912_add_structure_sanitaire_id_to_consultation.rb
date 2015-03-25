class AddStructureSanitaireIdToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :structure_sanitaire_id, :integer
  end
end

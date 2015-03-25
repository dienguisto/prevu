class RemoveStructureSanitaireIdFromConsultation < ActiveRecord::Migration
  def change
    remove_column :consultations, :structure_sanitaire_id, :integer
  end
end

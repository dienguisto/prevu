class AddFormationSanitaireIdToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :formation_sanitaire_id, :integer
  end
end

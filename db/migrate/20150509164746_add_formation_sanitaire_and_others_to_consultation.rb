class AddFormationSanitaireAndOthersToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :origine_id, :integer, index: true
    add_column :consultations, :date_referencement, :date
  end
end

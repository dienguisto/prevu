class AddTypeActeMedicalIdToConsultation < ActiveRecord::Migration
  def change
    add_column :consultations, :type_acte_medical_id, :integer
  end
end

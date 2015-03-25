class RemoveTypeCategorieMedicalIdFromConsultation < ActiveRecord::Migration
  def change
    remove_column :consultations, :type_categorie_medical_id, :integer
  end
end

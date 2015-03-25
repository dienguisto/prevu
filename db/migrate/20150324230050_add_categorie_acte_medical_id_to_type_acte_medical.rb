class AddCategorieActeMedicalIdToTypeActeMedical < ActiveRecord::Migration
  def change
    add_column :type_acte_medicals, :categorie_acte_medical_id, :integer
  end
end

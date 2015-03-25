class CreateConsultations < ActiveRecord::Migration
  def change
    create_table :consultations do |t|
      t.text :description
      t.float :montant
      t.integer :type_categorie_medical_id
      t.integer :adherent_id
      t.integer :pharmacy_id

      t.timestamps null: false
    end
  end
end

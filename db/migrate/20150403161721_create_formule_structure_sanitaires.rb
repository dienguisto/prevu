class CreateFormuleStructureSanitaires < ActiveRecord::Migration
  def change
    create_table :formule_structure_sanitaires do |t|
      t.references :formule, index: true
      t.references :formation_sanitaire, index: true
      t.boolean :actif, default: false

      t.timestamps null: false
    end
    add_foreign_key :formule_structure_sanitaires, :formules
    add_foreign_key :formule_structure_sanitaires, :formation_sanitaires
  end
end

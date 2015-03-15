class CreateAffectationAperitrices < ActiveRecord::Migration
  def change
    create_table :affectation_aperitrices do |t|
      t.references :groupe, index: true
      t.references :structure_aperitrice, index: true
      t.boolean :actif, default: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :affectation_aperitrices, :groupes
    add_foreign_key :affectation_aperitrices, :structure_aperitrices
  end
end

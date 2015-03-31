class CreateVersements < ActiveRecord::Migration
  def change
    create_table :versements do |t|
      t.references :compte, index: true, null: false
      t.references :mandataire, index: true
      t.float :montant, null: false

      t.timestamps null: false
    end
    add_foreign_key :versements, :comptes
    add_foreign_key :versements, :mandataires
  end
end

class CreateSouscriptions < ActiveRecord::Migration
  def change
    create_table :souscriptions do |t|
      t.references :adherent, index: true
      t.references :formule, index: true
      t.boolean :paye, default: false
      t.datetime :date_paiement
      t.boolean :actif, default: false
      t.datetime :date_activation
      t.date :date_expiration

      t.timestamps null: false
    end
    add_foreign_key :souscriptions, :adherents
    add_foreign_key :souscriptions, :formules
  end
end

class CreateCotisations < ActiveRecord::Migration
  def change
    create_table :cotisations do |t|
      t.references :adherent, index: true
      t.references :souscription, index: true
      t.float :montant, null: false
      t.date :pour_la_date, null: false, index: true
      t.boolean :paye, default: false
      t.datetime :date_paiement

      t.timestamps null: false
    end
    add_foreign_key :cotisations, :adherents
    add_foreign_key :cotisations, :formules
  end
end

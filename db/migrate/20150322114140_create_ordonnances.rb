class CreateOrdonnances < ActiveRecord::Migration
  def change
    create_table :ordonnances do |t|
      t.float :prix_total
      t.references :adherent, index: true
      t.references :pharmacy, index: true

      t.timestamps null: false
    end
    add_foreign_key :ordonnances, :adherents
    add_foreign_key :ordonnances, :pharmacies
  end
end

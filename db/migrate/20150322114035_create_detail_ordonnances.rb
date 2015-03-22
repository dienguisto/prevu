class CreateDetailOrdonnances < ActiveRecord::Migration
  def change
    create_table :detail_ordonnances do |t|
      t.integer :quantite
      t.float :prix_unitaire

      t.timestamps null: false
    end
  end
end

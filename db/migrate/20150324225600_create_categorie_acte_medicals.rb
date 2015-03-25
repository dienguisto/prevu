class CreateCategorieActeMedicals < ActiveRecord::Migration
  def change
    create_table :categorie_acte_medicals do |t|
      t.string :nom

      t.timestamps null: false
    end
  end
end

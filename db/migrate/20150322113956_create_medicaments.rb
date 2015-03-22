class CreateMedicaments < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
      t.string :nom
      t.string :reference
      t.boolean :actif

      t.timestamps null: false
    end
  end
end

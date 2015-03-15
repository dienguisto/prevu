class CreateStructureAperitrices < ActiveRecord::Migration
  def change
    create_table :structure_aperitrices do |t|
      t.string :nom
      t.string :adresse
      t.date :date_adhesion

      t.timestamps null: false
    end
    add_index :structure_aperitrices, :nom, unique: true
  end
end

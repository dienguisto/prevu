class CreateGroupes < ActiveRecord::Migration
  def change
    create_table :groupes do |t|
      t.references :structure_assurance, index: true
      t.string :nom, null: false

      t.timestamps null: false
    end
    add_foreign_key :groupes, :structure_assurances
  end
end

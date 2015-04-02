class CreateMandataires < ActiveRecord::Migration
  def change
    create_table :mandataires do |t|
      t.string :prenom, null: false
      t.string :nom, null: false
      t.string :telephone
      t.string :adresse
      t.integer :type_piece
      t.string :numero_piece

      t.timestamps null: false
    end
  end
end

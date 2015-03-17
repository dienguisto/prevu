class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :titre
      t.string :nom
      t.string :prenom
      t.string :telephone
      t.string :telephone1
      t.string :adresse

      t.timestamps null: false
    end
  end
end

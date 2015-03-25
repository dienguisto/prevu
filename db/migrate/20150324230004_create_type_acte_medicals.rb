class CreateTypeActeMedicals < ActiveRecord::Migration
  def change
    create_table :type_acte_medicals do |t|
      t.string :nom

      t.timestamps null: false
    end
  end
end

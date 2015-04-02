class CreateComptes < ActiveRecord::Migration
  def change
    create_table :comptes do |t|
      t.references :proprietaire, polymorphic: true, index: true
      t.float :total_versement, null: false, default: 0
      t.float :solde, null: false, default: 0

      t.timestamps null: false
    end
  end
end

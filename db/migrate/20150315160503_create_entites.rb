class CreateEntites < ActiveRecord::Migration
  def change
    create_table :entites do |t|
      t.references :entite, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

class CreateFormationSanitaires < ActiveRecord::Migration
  def change
    create_table :formation_sanitaires do |t|
      t.integer :niveau, null: false

      t.timestamps null: false
    end
  end
end

class RemoveTableFormulesStructureSanitaires < ActiveRecord::Migration
  def change
    drop_join_table :formules, :structure_sanitaires
  end
end

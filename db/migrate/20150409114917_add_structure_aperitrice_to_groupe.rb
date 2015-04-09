class AddStructureAperitriceToGroupe < ActiveRecord::Migration
  def change
    add_reference :groupes, :structure_aperitrice, index: true
    add_foreign_key :groupes, :structure_aperitrices
  end
end

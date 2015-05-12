class AddStructureAssuranceToGroupe < ActiveRecord::Migration
  def change
    add_reference :groupes, :structure_assurance, index: true
    add_foreign_key :groupes, :structure_assurances
  end
end

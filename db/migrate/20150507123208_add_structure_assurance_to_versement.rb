class AddStructureAssuranceToVersement < ActiveRecord::Migration
  def change
    add_reference :versements, :structure_assurance, index: true
    add_foreign_key :versements, :structure_assurances
  end
end

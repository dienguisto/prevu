class AddStructureAssuranceToAdherent < ActiveRecord::Migration
  def change
    add_reference :adherents, :structure_assurance, index: true
    add_foreign_key :adherents, :structure_assurances
  end
end

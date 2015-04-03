class AddStructureAssuranceToServices < ActiveRecord::Migration
  def change
    add_reference :ordonnances, :structure_assurance, index: true
    add_reference :consultations, :structure_assurance, index: true
  end
end

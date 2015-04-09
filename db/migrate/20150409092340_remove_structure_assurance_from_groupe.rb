class RemoveStructureAssuranceFromGroupe < ActiveRecord::Migration
  def change
    remove_column :groupes, :structure_assurance_id, :integer
  end
end

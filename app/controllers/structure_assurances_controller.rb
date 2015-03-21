class StructureAssurancesController < ApplicationController
  before_action :set_assurance, only: [:activer, :desactiver]

  def activer
    @structure_assurance.activate!
    flash[:notice] = 'La structure est activée par succés'
    redirect_to @structure_assurance.structure
  end

  def desactiver
    @structure_assurance.desactivate!
    flash[:notice] = 'La structure est desactivée par succés'
    redirect_to @structure_assurance.structure
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_assurance
    @structure_assurance = StructureAssurance.find(params[:id])
  end
end

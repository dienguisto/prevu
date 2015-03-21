class StructureSanitairesController < ApplicationController
  before_action :set_sanitaire, only: [:activer, :desactiver]

  def activer
    @structure_sanitaire.activate!
    flash[:notice] = 'La structure est activée par succés'
    redirect_to @structure_sanitaire.structure
  end

  def desactiver
    @structure_sanitaire.desactivate!
    flash[:notice] = 'La structure est desactivée par succés'
    redirect_to @structure_sanitaire.structure
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sanitaire
    @structure_sanitaire = StructureSanitaire.find(params[:id])
  end
end

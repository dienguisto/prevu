class WsController < ApplicationController
  layout false

  def get_groupes
    @groupes = Groupe.where("nom ILIKE ?", "%#{params[:nom]}%")
    render :json => @groupes
  end

  def adherent_infos
    @adherent = Adherent.where("matricule ILIKE ?", "%#{params[:matricule]}%")
    render :json => @adherent
  end

end
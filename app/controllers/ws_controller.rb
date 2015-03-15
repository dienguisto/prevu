class WsController < ApplicationController
  layout false

  def get_groupes
    @groupes = Groupe.where("nom ILIKE ?", "%#{params[:nom]}%")
    render :json => @groupes
  end

end
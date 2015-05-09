class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_adherent, :current_structure_assurance, :current_pharmacy, :current_formation_sanitaire,
                :current_structure_aperitrice

  before_action :authenticate_user!
  # layout :layout_by_resource

  # @return [StructureAperitrice]
  def current_structure_aperitrice
    return nil unless current_user.user_structure_aperitrice?
    current_user.entite.entite
  end

  # @return [StructureSanitaire]
  def current_structure_assurance
    return nil unless current_user.user_structure_assurance?
    current_user.entite.entite.structure_assurance
  end

  # @return [Pharmacy]
  def current_pharmacy
    return nil unless current_user.user_pharmacie?
    current_user.entite.entite.structure_sanitaire.structure
  end

  # @return [FormationSanitaire]
  def current_formation_sanitaire
    return nil unless current_user.user_formation_sanitaire?
    current_user.entite.entite.structure_sanitaire.structure
  end

  # @return [Adherent]
  def current_adherent
    if session[:adherent_id]
      @current_adherent ||= Adherent.find(session[:adherent_id])
    elsif params[:adherent_id]
      @current_adherent ||= Adherent.find(params[:adherent_id])
    end
  end

  private

  def not_for_structure_sanitaire!
    if current_user.user_structure_sanitaire?
      redirect_to_error
    end
  end

  def can_parrain_user
    unless current_adherent.parrain.nil?
      redirect_to_error
    end
  end

  def only_for_admins!
    unless current_user.administrateur?
      redirect_to_error
    end
  end

  def only_for_structure_asssurance!
    unless current_user.user_structure_assurance?
      redirect_to_error
    end
  end

  def only_for_pharmacie!
    unless current_user.user_pharmacie?
      redirect_to_error
    end
  end

  def only_for_formation_sanitaire!
    unless current_user.user_formation_sanitaire?
      redirect_to_error
    end
  end

  def redirect_to_error
    flash[:error] = 'Vous ne pouvez pas executer cette action'
    redirect_to (request.referrer || root_path)
  end

  # def layout_by_resource
  #   if  devise_controller? && action_name == 'new'
  #     'empty'
  #   else
  #     'application'
  #   end
  # end
end

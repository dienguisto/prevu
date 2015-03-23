class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_adherent, :current_structure_assurance

  def current_structure_assurance
    return nil unless user_signed_in? and current_user.user_structure_assurance?
    current_user.entite.entite.structure_assurance
  end

  private

  def current_adherent
    @current_adherent ||= Adherent.find(session[:adherent_id]) if session[:adherent_id]
  end

  def only_for_structure_asssurance!
    unless user_signed_in? and current_user.user_structure_assurance?
      redirect_to_error
    end
  end

  def only_for_pharmacie!
    unless user_signed_in? and current_user.user_pharmacie?
      redirect_to_error
    end
  end

  def redirect_to_error
    flash[:error] = 'Vous ne pouvez pas executer cette action'
    redirect_to root_path
  end
end

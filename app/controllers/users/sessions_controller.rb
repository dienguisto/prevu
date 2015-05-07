class  Users::SessionsController < Devise::SessionsController
  skip_before_filter :check_concurrent_session
  # layout 'empty'

  def create
    super
    set_login_token
  end

  private
  def set_login_token
    token = Devise.friendly_token
    session[:token] = token
    current_user.login_token = token
    current_user.save
  end
end
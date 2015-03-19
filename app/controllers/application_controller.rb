class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!, :check_admin_authorization

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def check_admin_authorization
    if user_signed_in? && !current_user.admin_authorization
      reset_session
      redirect_to new_user_session_path, alert: "O Administrador do sistema precisa aprovar seu cadastro para que você possa ter acesso."
    end
  end
end

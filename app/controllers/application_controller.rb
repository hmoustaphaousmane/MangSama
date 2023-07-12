class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :gender, :birth, :bio) }  
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, notify: 'Accès réfusé!'
  end
end

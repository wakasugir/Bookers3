class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    flash[:notice] = 'Welcome! You have signed up successfully.'
    user_path(resource) 
  end 

  protected

  def authenticate_user? # !Login => login screen
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:email]
  end
end

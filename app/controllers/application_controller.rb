class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :phone, :admin, :role_id, :airport_id])

    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :role, :name, :age, :phone, :designation,:airport_id)}
  end
  
end

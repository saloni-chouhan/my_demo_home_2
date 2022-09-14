class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :configure_permitted_parameters
  
  # protected
  #   def configure_permitted_parameters
  #       # Fields for sign up
  #       devise_parameter_sanitizer.require(:sign_up).permit(:first_name,:last_name, :email, :password) 
  #   end
  
end

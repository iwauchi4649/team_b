class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname_full,:lastname_full,:firstname_cana,:lastname_cana, :name_cana, :birth_year, :birth_month, :birth_day, :birth_day, :call_number, :point])
  end
end

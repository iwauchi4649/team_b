class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    '/review/:review_id/main'
  end
  protected

    def configure_permitted_parameters
      # sign_inのときに、usernameも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name_full])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name_cana])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_year])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_month])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_day])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:call_number])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:password])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:birth_day])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:encrypted_password])

    end
end

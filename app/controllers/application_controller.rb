class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  protected

  def configure_permitted_parameters
    # strong parametersを設定し、user_idを許可
    devise_parameter_sanitizer.for(:sign_up){|u|
        u.permit(:nickname, :name_full, :name_cana, :birth_year, :birth_month, :birth_day, :call_number, :encrypted_password)
    }
    devise_parameter_sanitizer.for(:sign_in){|u|
      u.permit(:nickname, :name_full, :name_cana, :birth_year, :birth_month, :birth_day, :call_number, :encrypted_password)
    }
end
end

# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def create
    super
    # @user = User.new
    # @user = User.new(configure_sign_up_params)
    # if @user.save!
    #   flash[:success] = "Welcome to the Sample App!"
    #   redirect_to "/review/:review_id/main"
    # else
    #   render :new
  end

  def new
    @user = User.new
  end

  def after_sign_up_path_for(resource)
    "/users/addresses"
  end

  def addresses
  end
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
 
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit(:nickname, :name_full, :name_cana, :birth_year, :birth_month, :birth_day, :call_number, :password)
  end
  devise_parameter_sanitizer.permit(:sign_in) do |user_params|
    user_params.permit(:nickname, :name_full, :name_cana, :birth_year, :birth_month, :birth_day, :call_number, :password)
  end
end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    users_addresses_path
  end
end

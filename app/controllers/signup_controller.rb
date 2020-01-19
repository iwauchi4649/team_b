class SignupController < ApplicationController
  def information
    @user = User.new #新規インスタンス作る
  end

  def phone
    # informationで入力した値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:firstname_full] = user_params[:firstname_full]
    session[:lastname_full] = user_params[:lastname_full]
    session[:firstname_cana] = user_params[:firstname_full]
    session[:lastname_cana] = user_params[:lastname_full]
    session[:birthday] = user_params[:birthday]
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :password, :firstname_full, :lastname_full, :firstname_cana, :lastname_cana,:birthday)
  end
end

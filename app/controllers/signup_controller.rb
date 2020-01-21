class SignupController < ApplicationController
  def information
    @user = User.new #新規インスタンス作る
  end

  # def first_validation
  #   session[:nickname] = user_params[:nickname]
  #   session[:email] = user_params[:email]
  #   session[:password] = user_params[:password]
  #   session[:firstname_full] = user_params[:firstname_full]
  #   session[:lastname_full] = user_params[:lastname_full]
  #   session[:firstname_cana] = user_params[:firstname_full]
  #   session[:lastname_cana] = user_params[:lastname_full]
  #   session[:birthday] = user_params[:birthday]
  #   @user = User.new(
  #     nickname: session[:nickname],
  #     email: session[:email]
  #     password: session[:password]
  #   )
  # end
  def phone
    @user = User.new
    # informationで入力した値をsessionに保存
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:password] = user_params[:password]
    # session[:firstname_full] = user_params[:firstname_full]
    # session[:lastname_full] = user_params[:lastname_full]
    # session[:firstname_cana] = user_params[:firstname_full]
    # session[:lastname_cana] = user_params[:lastname_full]
    # session[:birthday] = user_params[:birthday]
    # @user = User.new
  end

  def address
    # phoneで入力した値をssesionに保存
    session[:call_number] = user_params[:call_number]
    @address = Address.new
  end

  def crcard
    # addressで入力した値をssesionに保存
    session[:address] = user_params[:address]
    session[:potal_code] = address_params[:potal_code]
    session[:prefecture] = address_params[:prefecture]
    session[:municipalties] = address_params[:municipalties]
    session[:build_name] = address_params[:build_name]
    @address =  Address.new
  end

  def done
    # crcardで入力した値をssesionに保存
    session[:card_number] = address_params[:card_number]
    session[:expiration_date] = address_params[:expiration_date]
    session[:security_code] = address_params[:security_code]
    @credit_card = Credit_card.new
  end

  def create
    @user = User.new(nickname: session[:nickname],
                    email: session[:email],
                    password: session[:password],
                    password_confirmation: session[:password_confirmation])
    # 万一ユーザーがcreateできなかった場合、全sessionをリセットして登録ページトップへリダイレクト
    unless @user.save
      reset_session
      redirect_to signup_index_path
      return
    end
  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      firstname_full: session[:firstname_full],
      lastname_full: session[:lastname_full],
      lastname_full: session[:lastname_full],
      firstname_cana: session[:firstname_cana],
      lastname_cana: session[:lastname_cana],
      birth_day: session[:birthday],
      call_number: session[:call_number],
    )
    @address = Address.new(
      address: session[:address],
      potal_code: session[:potal_code],
      prefecture: session[:prefecture],
      municipalties: session[:municipalties],
      build_name: session[:build_name]
    )    
    @credit_card = Credit_card.new(
      card_number: session[:card_number],
      expiration_date: session[:expiration_date],
      security_code: session[:security_code]
    )
    # if @user.save
    #   session[:id] = @user.id
    # end
  end
  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :password,
      :firstname_full,
      :lastname_full,
      :firstname_cana,
      :lastname_cana,
      :birth_day,
      :phone_number,
      address_attributes: [:potal_code, :prefecture, :municipalties, :build_name, :address]
      )
  end
  def address_params
    params.require(:address).permit(
      :potal_code,
      :prefecture,
      :municipalties,
      :build_name,
      :address 
      )
  end

  def credit_card_params
    params.require(:credit_card).permit(
      :card_number,
      :expiration_date,
      :security_code
    )
end

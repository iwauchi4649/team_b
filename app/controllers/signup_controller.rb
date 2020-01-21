class SignupController < ApplicationController
  def information
    @user = User.new #新規インスタンス作る
  end

  def phone
    @user = User.new
  end

  def address
    @address = Address.new
    # @user.address.build()
  end

  def crcard
    @creditcard = Creditcard.new
    @user.credit_card.build()
  end

  def done
  end

  def create
    @user = User.new(nickname: session[:nickname],
                    email: session[:email],
                    password: session[:password],
                    password_confirmation: session[:password_confirmation],
                    firstname_full: session[:firstname_full],
                    lastname_full: session[:lastname_full],
                    lastname_full: session[:lastname_full],
                    firstname_cana: session[:firstname_cana],
                    lastname_cana: session[:lastname_cana],
                    birth_day: session[:birthday],
                    call_number: session[:call_number]
                    )
    # 万一ユーザーがcreateできなかった場合、全sessionをリセットして登録ページトップへリダイレクト
    unless @user.save
      reset_session
      redirect_to information_signup_index_path
      return
    end

    @address = Address.create(
      user: @user,
      address: session[:address],
      potal_code: session[:potal_code],
      prefecture: session[:prefecture],
      municipalties: session[:municipalties],
      build_name: session[:build_name]
    )    
    unless @address.save
      reset_session
      redirect_to address_signup_index_path
      return
    end
    
    @creditcard = Creditcard.create(
      user: @user,
      card_number: session[:card_number],
      expiration_date: session[:expiration_date],
      security_code: session[:security_code]
    )
    unless @creditcard.save
      reset_session
      redirect_to crcard_signup_index_path
      return
    end
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
      address_attributes: [:id,:potal_code, :prefecture, :municipalties, :build_name, :address],
      credit_card_attribures: [:id, :card_number,:expiration_date,:security_code]
      )
  end
end

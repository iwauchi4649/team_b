class SignupController < ApplicationController
  def information
    @user = User.new #新規インスタンス作る
  end

  def phone
    @user = User.new
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:firstname_full] = user_params[:firstname_full]
    session[:lastname_full] = user_params[:lastname_full]
    session[:firstname_cana] = user_params[:firstname_full]
    session[:lastname_cana] = user_params[:lastname_full]
    session[:birthday] = user_params[:birthday]

  end

  def address
    @user = User.new
    @user.addresses.build()
    session[:call_number] = user_params[:call_number]
  end

  def crcard
    @user = User.new
    @user.credit_cards.build()
    session[:address] = user_params[:address]
    session[:potal_code] = user_params[:potal_code]
    session[:prefecture] = user_params[:prefecture]
    session[:municipalties] = user_params[:municipalties]
    session[:build_name] = user_params[:build_name]
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
    if @user.save
      　　　# ログインするための情報を保管
            session[:id] = @user.id
            redirect_to review_main_path
          else
            render 'information_signup_index_path'
          end
  end
    # 万一ユーザーがcreateできなかった場合、全sessionをリセットして登録ページトップへリダイレクト
  #   unless @user.save
  #     reset_session
  #     redirect_to information_signup_index_path
  #     return
  #   end

  #   @address = Address.create(
  #     user: @user,
  #     address: session[:address],
  #     potal_code: session[:potal_code],
  #     prefecture: session[:prefecture],
  #     municipalties: session[:municipalties],
  #     build_name: session[:build_name]
  #   )    
  #   unless @address.save
  #     reset_session
  #     redirect_to address_signup_index_path
  #     return
  #   end
    
  #   @creditcard = Creditcard.create(
  #     user: @user,
  #     card_number: session[:card_number],
  #     expiration_date: session[:expiration_date],
  #     security_code: session[:security_code]
  #   )
  #   unless @creditcard.save
  #     reset_session
  #     redirect_to crcard_signup_index_path
  #     return
  #   end
  # end
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
      :call_number,
      :email,
      addresses_attributes: [:id,:potal_code, :prefecture, :municipalties, :build_name, :address],
      credit_cards_attribures: [:id, :card_number,:expiration_date,:security_code]
      )
  end

end

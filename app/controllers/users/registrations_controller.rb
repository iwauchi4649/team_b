# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  require "payjp"
  before_action :configure_sign_up_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = { user: @user.attributes }
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @phone = @user.build_phone
    render :new_phone
  end

  def create_phone
    @user = User.new(session["devise.regist_data"]["user"])
    @phone = Phone.new(phone_params)
    unless @phone.valid?
      flash.now[:alert] = @phone.errors.full_messages
      render :new_phone and return
    end
    session["devise.regist_phone"] = { phone: @phone.attributes }
    session["devise.regist_phone"][:phone]["number"] = params[:phone][:number]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @phone = Phone.new(session["devise.regist_phone"]["phone"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    session["devise.regist_address"] = { address: @address.attributes }
    @credit_card = @user.build_credit_card
    render :new_crcard
  end

  def create_credit_card
    @user = User.new(session["devise.regist_data"]["user"])
    @phone = Phone.new(session["devise.regist_phone"]["phone"])
    @address = Address.new(session["devise.regist_address"]["address"])
    @user.build_address(@address.attributes)
    @user.build_phone(@phone.attributes)
    if @user.save!
      sign_in(:user, @user)
    else
      render :new_crcard
    end

    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY] # APIキーの呼び出し
    if params["payjp_token"].blank? # ここはJavaScriptの.append()内のname属性です
      render :new_crcard
    else
      customer = Payjp::Customer.create( # customerの定義、ここの情報を元に、カード情報との紐付けがされる
        description: "test",                    # なくてもいいです
        email: current_user.email,              # なくてもいいです
        card: params["payjp_token"],            # 必須です
        metadata: { user_id: current_user.id }, # なくてもいいです
      )
      @card = Card.new( # カードテーブルのデータの作成
        user_id: current_user.id,        # ここでcurrent_user.idがいるので、前もってsigninさせておく
        customer_id: customer.id,        # customerは上で定義
        card_id: customer.default_card, # .default_cardを使うことで、customer定義時に紐付けされたカード情報を引っ張ってくる ここがnullなら上のcustomerのcard: params['payjp_token']が読み込めていないことが多い
      )
    end
    if @card.save
      redirect_to action: "done"
    else
      redirect_to action: "create"
    end

    def done
      sign_in User.find(session[:id]) unless user_signed_in?
    end

    def mypage
    end

    def crcard_add
    end

    def crcard_add_input
    end

    def logout
    end

    def personal
    end
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  def phone_params
    params.require(:phone).permit(:number)
  end

  def address_params
    params.require(:address).permit(:banchi, :potal_code, :prefectures, :municipalties, :buildname)
  end
end

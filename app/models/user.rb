class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable,omniauth_providers:  %i(google facebook)
  # omniauthのコールバック時に呼ばれるメソッド
  has_many :goods
  has_many :credit_cards
  has_many :evalutions
  has_many :comments
  has_one :address
  has_one :phone
  has_one :credit_card
  
  protected
  #コールバックを受けた時にユーザが既にアプリケーションの中で認知されているかどうかを判断する
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)
    #なければユーザーのインスタンス作成
    unless user
      user = User.create(name:     auth.info.name,
                        provider: auth.provider,
                        uid:      auth.uid,
                        token:    auth.credentials.token,
                        email:    auth.info.email,
                        password: Devise.friendly_token[0, 20],
                        meta:     auth.to_yaml)
    end
    user
  end
  
  
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.new(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
       user.save(validate: false)
    end
    user
  end

end

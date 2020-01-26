class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :goods
  has_many :credit_cards
  has_many :evalutions
  has_many :comments
  has_one :address
  has_one :phone
  has_one :credit_card
  

end

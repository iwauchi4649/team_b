class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :goods
  has_many :credit_cards
  has_many :evalutions
  has_many :comments
  has_many :adress

  validates :email, presence: true 
  validates :email, uniqueness: true
  validates :nickname, presence: true
  validates :name_full, presence: true
  validates :name_cana, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  validates :call_number, presence: true
  
end

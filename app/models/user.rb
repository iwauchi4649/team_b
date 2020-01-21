class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :goods
  has_one :credit_card
  has_many :evalutions
  has_many :comments
  has_one :address
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :credit_card
  validates_uniqueness_of :encrypted_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,              presence: true, length: {minimum: 7, maximum: 128},    format: { with: PASSWORD_VALIDATION }
  validates :nickname,              presence: true, length: {maximum: 20}
  validates :firstname_full,        presence: true, length: {maximum: 20}
  validates :lastname_full,         presence: true, length: {maximum: 20}
  validates :firstname_cana,        presence: true, length: {maximum: 20}
  validates :lastname_cana,         presence: true, length: {maximum: 20}
  validates :birth_day,             presence: true
  validates :call_number,           presence: true, length: {maximum: 20}
  

end

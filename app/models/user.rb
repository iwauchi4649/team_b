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
end

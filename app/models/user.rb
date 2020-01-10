class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :goods
  has_many :credit_cards
  has_many :evalutions
  has_many :comments
  has_many :addresses
  validates_uniqueness_of :password
end

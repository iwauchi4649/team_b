class Phone < ApplicationRecord
  
  belongs_to :user, optional: true
  PHONE_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :number,presence: true,length:{maximum: 20}, format: { with: PHONE_VALIDATION }
end

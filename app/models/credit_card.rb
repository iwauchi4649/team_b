class CreditCard < ApplicationRecord
  belongs_to :user, optional: true
  CRCARD_VALIDATION = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i
  validates :card_number ,:expiration_date,:security_code, length: {maximum: 20},presence: true,format: { with: CRCARD_VALIDATION }
end

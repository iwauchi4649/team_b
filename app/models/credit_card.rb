class CreditCard < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_number ,:expiration_date,:security_code, presence: true
end

class CreditCard < ApplicationRecord


  # validates :user_id, presence: true 
  validates :card_number, presence: true 
  validates :expiration_date_month, presence: true 
  validates :expiration_date_year, presence: true 
  validates :security_code, presence: true 

end

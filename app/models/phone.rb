class Phone < ApplicationRecord
  
  belongs_to :user, optional: true
  validates :number,presence: true
end

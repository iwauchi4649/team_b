class Phone < ApplicationRecord
  
  belongs_to :user, optional: true
  validates :number,presence: true,length: { in:8..12 } 
end

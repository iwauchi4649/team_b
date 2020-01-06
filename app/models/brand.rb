class Brand < ApplicationRecord
  has_many :goods, dependent: :destroy
end

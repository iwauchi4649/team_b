class Good < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :category
  belongs_to :condition
  has_many :likes,dependent: :destroy
  has_many :photos,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :evalutions,dependent: :destroy
end

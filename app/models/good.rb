class Good < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :evalutions, dependent: :destroy
  accepts_nested_attributes_for :photos , allow_destroy: true
  def self.search_result(search)
    if search
      Good.where(['name LIKE ?', "%#{search}%"])
    else
      Good.all
    end
  end
end

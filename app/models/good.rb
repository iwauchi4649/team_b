class Good < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
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
  accepts_nested_attributes_for :photos, allow_destroy: true
  validates :fee, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :name, presence: true
  validates :discription, presence: true
  validates :condition, presence: true
  validates :delivery_type, presence: true
  validates :prefecture, presence: true
  validates :day, presence: true
  validates :fee, presence: true
  validates_associated :photos

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end

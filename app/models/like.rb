class Like < ApplicationRecord
  belongs_to :user
  belongs_to :good, counter_cache: :likes_count

  validates :user_id, presence: true
  validates :good_id, presence: true
  validates_uniqueness_of :good_id, scope: :user_id
end

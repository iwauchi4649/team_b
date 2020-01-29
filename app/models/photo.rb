class Photo < ApplicationRecord
  belongs_to :good , optional: true
  mount_uploader :image, ImageUploader
end

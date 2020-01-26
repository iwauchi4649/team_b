class Photo < ApplicationRecord
  belongs_to :good
  mount_uploader :image, ImageUploader
end

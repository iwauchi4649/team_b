class Category < ApplicationRecord
  has_many :goods
  has_ancestry
end

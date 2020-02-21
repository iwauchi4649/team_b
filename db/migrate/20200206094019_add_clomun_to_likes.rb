class AddClomunToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :goods, :likes_count, :integer
  end
end

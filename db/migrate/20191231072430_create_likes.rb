class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :good, foreign_key: true
      t.integer :like, null: false
      t.timestamps
    end
  end
end

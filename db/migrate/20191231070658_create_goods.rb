class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :category_id, null: false, foreign_key: true
      t.references :brand_id, null: false, foreign_key: true
      t.references :condition_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :discription, null: false
      t.string :size, null: false
      t.string :delivery_type, null: false
      t.string :prefecture, null: false
      t.string :day, null: false
      t.integer :fee, null: false
      t.timestamps
    end
  end
end

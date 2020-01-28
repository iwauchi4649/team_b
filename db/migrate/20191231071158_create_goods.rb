class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.integer :buyer_id
      t.string :brand
      t.string :name
      t.string :condition
      t.text :discription
      t.string :size
      t.string :delivery_type
      t.string :prefecture
      t.string :day
      t.integer :fee
      t.timestamps
    end
  end
end

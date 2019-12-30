class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :address, null:false
      t.integer :portal_code, null:false
      t.string :prefectures, null:false
      t.string :municipalties, null:false
      t.timestamps null:false
    end
  end
end

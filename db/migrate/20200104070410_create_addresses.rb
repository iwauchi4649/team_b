class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user_id
      t.string :address, null:false
      t.integer :potal_code, null:false
      t.string :prefectures, null:false
      t.string :municipalties, null:false
      t.timestamps
    end
  end
end

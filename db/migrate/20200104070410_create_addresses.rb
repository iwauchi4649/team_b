class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :banchi, null:false, limit: 40
      t.integer :potal_code, null:false, limit: 5
      t.string :prefectures, null:false, limit: 40
      t.string :municipalties, null:false, limit: 40
      t.string :buildname, null:false, limit:40
      t.timestamps
    end
  end
end

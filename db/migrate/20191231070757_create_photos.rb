class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :good_id, null: false, foreign_key: true
      t.string :image, null: false
      t.timestamps
    end
  end
end

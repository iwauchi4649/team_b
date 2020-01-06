class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :good_id, null: false, foreign_key: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end

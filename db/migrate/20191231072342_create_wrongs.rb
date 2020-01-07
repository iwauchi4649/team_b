class CreateWrongs < ActiveRecord::Migration[5.2]
  def change
    create_table :wrongs do |t|
      t.references :good, foreign_key: true
      t.string :wrong, null: false
      t.timestamps
    end
  end
end

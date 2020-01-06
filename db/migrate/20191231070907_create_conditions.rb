class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.references :good_id, null: false, foreign_key: true
      t.string :condition, null: false
      t.timestamps
    end
  end
end

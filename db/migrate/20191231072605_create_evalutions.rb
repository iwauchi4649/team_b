class CreateEvalutions < ActiveRecord::Migration[5.2]
  def change
    create_table :evalutions do |t|
      t.references :good, foreign_key: true
      t.integer :evalution, null: false
      t.timestamps
    end
  end
end

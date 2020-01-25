class CreatePhones < ActiveRecord::Migration[5.2]
  def change
    create_table :phones do |t|
      t.references :user
      t.string :number, null:false, unique: true, default: 0
      t.timestamps
    end
  end
end

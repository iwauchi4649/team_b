class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreign_key: true
      t.string :card_number, null:false, null:false,unique: true
      t.integer :expiration_date_month, null:false
      t.integer :expiration_date_year, null:false
      t.integer :security_code, null:false
      t.timestamps null:false
    end
  end
end

class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.references :user_id, null:false
      t.integer :card_number, null:false,unique: true
      t.date :expiration_date_month, null:false
      t.date :expiration_date_year, null:false
      t.integer :security_code, null:false
      t.timestamps
    end
  end
end

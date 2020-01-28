class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.references :user, null:false
      t.integer :card_number, null:false,unique: true, limit: 5
      t.date :expiration_date, null:false
      t.integer :security_code, null:false, limit: 5
      t.timestamps
    end
  end
end

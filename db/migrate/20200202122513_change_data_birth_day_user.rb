class ChangeDataBirthDayUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :birth_day, :date
  end
end

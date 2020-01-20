class AddbuildNameToaddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :build_name, :string
  end
end

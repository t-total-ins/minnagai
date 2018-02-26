class RemoveColumnsToUsers < ActiveRecord::Migration[5.1]
  def up
    remove_column :users, :pref_k, :string
    remove_column :users, :city_k, :string
    remove_column :users, :address_k, :string
  end
  def down
  	add_column :users, :pref_k, :string, limit:20#, null: false
    add_column :users, :city_k, :string, limit:30#, null: false
    add_column :users, :address_k, :string, limit:100#, null: false
  end
end

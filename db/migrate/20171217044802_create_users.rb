class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :account, foreign_key: true
      t.string :first_name, limit:15, null: false
      t.string :name, limit:15, null: false
      t.string :first_name_k, limit:15, null: false
      t.string :name_k, limit:15, null: false
      t.string :pref, limit:10, null: false
      t.string :city, limit:10, null: false
      t.string :address, limit:50, null: false
      t.string :post_number, limit:7, null: false
      t.string :pref_k, limit:20, null: false
      t.string :city_k, limit:30, null: false
      t.string :address_k, limit:100, null: false
      t.string :tel, limit:13, null: false #TODO:limit:11にする
      t.date :birth, null: false
      t.integer :sex, limit:1, null: false
      t.string :mail, limit:100, null: false
      t.integer :delete_flg, limit:1

      t.timestamps
      t.datetime :deleted_at #20180108論理削除用追加
    end
  end
end

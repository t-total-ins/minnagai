class CreateJoins < ActiveRecord::Migration[5.1]
  def change
    create_table :joins do |t|
      t.references :account, foreign_key: true
      t.references :project, foreign_key: true
      t.integer :number_of_orders, null:false
      t.text :purpose, limit:10
      t.text :join_maker, limit:100
      t.text :join_product, limit:100
      t.text :join_attract, limit:1000
      t.text :join_option, limit:1000

      t.timestamps
      t.datetime :deleted_at #20180108論理削除用追加
    end

  add_index :joins, [:account_id, :project_id]#, unique: true 再登録可能にする20180108
  add_index :joins, [:project_id, :account_id]#, unique: true  
  
  end
end

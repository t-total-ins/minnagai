class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.references :project, foreign_key: true #TODO:プロジェクトとアカウントで一意になる
      t.references :account, foreign_key: true
      t.integer :number_of_orders
      t.integer :total_amount
      t.datetime :due_date
      t.boolean :payment_flg
      t.boolean :delivery_flg

      t.timestamps
      t.datetime :deleted_at #20180108論理削除用追加
    end
  end
end

class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :account, foreign_key: true
      t.string :project_category, limit:50, null: false 
      t.string :project_name, limit:100, null: false
      t.string :maker, limit:50, null: false
      t.string :product, limit:100, null: false
      t.text :option, limit:1000
      t.binary :image1, limit: 5.megabyte
      t.binary :image2, limit: 5.megabyte
      t.binary :image3, limit: 5.megabyte
      t.binary :image4, limit: 5.megabyte
      t.binary :image5, limit: 5.megabyte
      t.text :attraction, limit:1000, null: false
      t.text :reason, limit:1000, null: false
      t.integer :amount_of_money, limit:8, null: false, default: 0
      #t.text :way_of_purchase, limit:8, null: false
      #t.text :way_of_payment, limit:8, null: false
      t.datetime :project_from, null: false
      t.datetime :project_to, null: false
      t.integer :status, null:false, default: 0 #20180108 プロジェクト結果のステータスを保持する用

      t.timestamps
      t.datetime :deleted_at #20180108論理削除用追加
    end
  end
end

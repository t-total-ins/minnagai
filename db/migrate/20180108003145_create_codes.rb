class CreateCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :codes do |t|
      t.string :content
      t.integer :content_no
      t.string :description

      t.timestamps
      t.datetime :deleted_at #20180108論理削除用追加
    end
  end
end

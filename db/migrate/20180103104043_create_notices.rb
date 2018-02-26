class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.text :title, limit:100, null:false
      t.text :content, limit:1000, null:false
      t.text :notice_to, limit:100

      t.timestamps
      t.datetime :deleted_at #20180108論理削除用追加
    end
  end
end

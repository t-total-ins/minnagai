class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :project, foreign_key: true
      t.references :account, foreign_key: true
      t.text :q_and_a, limit:1, null:false
      t.text :title, limit:100, null:false
      t.text :content, limit:1000, null:false

      t.timestamps
      t.datetime :deleted_at #20180108論理削除用追加
    end

  add_index :questions, [:account_id, :project_id]
  add_index :questions, [:project_id, :account_id]

  end
end
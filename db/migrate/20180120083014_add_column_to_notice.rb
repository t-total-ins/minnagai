class AddColumnToNotice < ActiveRecord::Migration[5.1]
  def up
    remove_column :notices, :notice_to
    add_column :notices, :to_project, :string, null: true, limit:8
    add_column :notices, :to_user, :string, null: true, limit:8
  end
  def down
  	add_column :notices, :notice_to, :text, limit:100
  	remove_column :notices, :to_project
  	remove_column :notices, :to_user
  end
end

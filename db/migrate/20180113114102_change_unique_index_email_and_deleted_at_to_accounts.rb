class ChangeUniqueIndexEmailAndDeletedAtToAccounts < ActiveRecord::Migration[5.1]
  def up
    remove_index :accounts, :email
    add_index :accounts, [:email, :deleted_at], unique: true, name: 'index_users_on_email_and_deleted_at'
  end
  def down
    remove_index :accounts, [:email, :deleted_at]
    add_index :accounts, :email, unique: true
  end
end

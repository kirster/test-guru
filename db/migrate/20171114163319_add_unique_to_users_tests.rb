class AddUniqueToUsersTests < ActiveRecord::Migration[5.1]
  def change
    remove_index :tests_users, [:user_id, :test_id]
    add_index :tests_users, [:user_id, :test_id], unique: true
  end
end

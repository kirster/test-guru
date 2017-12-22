class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :tests, :user_id
    add_index :categories, :title
    add_index :answers, :correct
    add_index :users, :created_at
    add_index :test_passages, :created_at
  end
end

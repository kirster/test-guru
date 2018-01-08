class ChangeIndexesInTestPassages < ActiveRecord::Migration[5.1]
  def change
    remove_index  :test_passages, :test_id
    remove_index  :test_passages, :user_id
    add_index     :test_passages, [:user_id, :test_id]
  end
end

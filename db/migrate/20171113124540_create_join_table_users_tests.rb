class CreateJoinTableUsersTests < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :tests do |t|
      t.index [:user_id, :test_id]
    end
  end
end

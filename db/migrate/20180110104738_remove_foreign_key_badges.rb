class RemoveForeignKeyBadges < ActiveRecord::Migration[5.1]
  def change
    remove_column :badges, :user_id
  end
end

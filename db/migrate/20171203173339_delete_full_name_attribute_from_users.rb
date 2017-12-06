class DeleteFullNameAttributeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :full_name, :string
  end
end

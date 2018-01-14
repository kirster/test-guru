class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :file_name
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :badges, :title
  end
end

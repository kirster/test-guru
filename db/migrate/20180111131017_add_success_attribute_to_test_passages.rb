class AddSuccessAttributeToTestPassages < ActiveRecord::Migration[5.1]
  def change
    add_column :test_passages, :success, :boolean, default: false
    add_index :test_passages, :success
  end
end

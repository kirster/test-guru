class CreateFeedbackMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :feedback_messages do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.timestamps
    end
  add_index :feedback_messages, :created_at
  end
end

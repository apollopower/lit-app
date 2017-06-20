class AddIndexToConversations < ActiveRecord::Migration[5.1]
  def change
    add_index :conversations, [:author_id, :recipient_id], unique: true
  end
end

class ChangeAuthorUniqueToFalse < ActiveRecord::Migration[5.1]
  def change
    remove_index :conversations, [:author_id, :recipient_id]
    add_index :conversations, [:author_id, :recipient_id], unique: false
  end
end

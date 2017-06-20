class ChangeForeignKeyForConversationsToIdeasTrue < ActiveRecord::Migration[5.1]
  def change
    change_column :conversations, :idea_id, :integer, foreign_key: true
  end
end

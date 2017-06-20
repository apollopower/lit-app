class AddIdeaIdToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :idea_id, :integer
  end
end

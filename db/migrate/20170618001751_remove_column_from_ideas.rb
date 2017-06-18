class RemoveColumnFromIdeas < ActiveRecord::Migration[5.1]
  def change
  	remove_column :ideas, :user_id
  end
end

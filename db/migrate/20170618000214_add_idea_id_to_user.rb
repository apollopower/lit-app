class AddIdeaIdToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :ideas_id, :integer
  end
end

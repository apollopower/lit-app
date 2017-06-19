class RemoveIdeasIdColumnFromUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :ideas_id
  end
end

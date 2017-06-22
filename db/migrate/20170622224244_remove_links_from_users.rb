class RemoveLinksFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :links
  end
end

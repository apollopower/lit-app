class AddUseridToUpvotes < ActiveRecord::Migration[5.1]
  def change
    add_column :upvotes, :user_id, :integer
  end
end

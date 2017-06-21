class AddUpvotesToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :upvotes_count, :integer, :default => 0
  end
end

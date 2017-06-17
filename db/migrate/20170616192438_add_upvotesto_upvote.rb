class AddUpvotestoUpvote < ActiveRecord::Migration[5.1]
  def change
    add_column :upvotes, :votes, :integer
  end
end

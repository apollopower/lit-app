class AddFavoritesToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :favorites_count, :integer
  end
end

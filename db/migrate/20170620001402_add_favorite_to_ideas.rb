class AddFavoriteToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :is_favorited, :boolean, default: false
  end
end

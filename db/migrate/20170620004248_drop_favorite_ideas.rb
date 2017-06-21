class DropFavoriteIdeas < ActiveRecord::Migration[5.1]
  def change
    drop_table :favorite_ideas
  end
end

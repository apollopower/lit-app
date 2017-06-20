class RemoveIdeaidFromFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :idea_id
  end
end

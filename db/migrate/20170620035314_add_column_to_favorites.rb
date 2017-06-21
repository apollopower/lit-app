class AddColumnToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :idea_id, :integer, polymorphic: true, index: true
  end
end

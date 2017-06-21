class CreateFavoriteIdeas < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_ideas do |t|
      t.integer :idea_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class AddCategoryToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :category, :string
  end
end

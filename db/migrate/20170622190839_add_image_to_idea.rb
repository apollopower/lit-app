class AddImageToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :image, :string
  end
end

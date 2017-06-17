class AddGuidanceToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :guidance, :text
  end
end

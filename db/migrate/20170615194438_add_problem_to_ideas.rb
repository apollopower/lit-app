class AddProblemToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :problem, :text
  end
end

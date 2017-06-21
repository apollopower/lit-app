class AddSummaryToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :summary, :text
    add_column :ideas, :problem, :text
    add_column :ideas, :guidance, :text
  end
end

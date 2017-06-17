class AddSummaryToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :summary, :text
  end
end

class AddSkillsToUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :skills, :string
  end
end

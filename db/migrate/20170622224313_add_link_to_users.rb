class AddLinkToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :github, :string
  	add_column :users, :linkedin, :string
  	add_column :users, :twitter, :string
  end
end

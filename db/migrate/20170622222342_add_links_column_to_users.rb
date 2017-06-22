class AddLinksColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :links, :string
  end
end

class AddDefaultForVerifyInConversations < ActiveRecord::Migration[5.1]
  def change
    change_column :conversations, :verify, :boolean, default: false
  end
end

class ChangeUsersToRecipients < ActiveRecord::Migration[5.1]
  def change
    change_column :conversations, :author_id, :integer, index: false
    change_column :conversations, :recipient_id, :integer, index: false
  end
end

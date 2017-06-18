class AddUsersToRecipients < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :author_id, :integer, index: true
    add_column :conversations, :recipient_id, :integer, index: true
  end
end

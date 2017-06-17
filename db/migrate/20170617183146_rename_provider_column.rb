class RenameProviderColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :provider, :oauth_provider
  end
end

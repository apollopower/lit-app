class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :avatar_url

      t.string :fb_id
      t.string :oauth_token
      t.string :oauth_provider
      t.datetime :oauth_expires_at
      t.timestamps null: false
    end
  end
end

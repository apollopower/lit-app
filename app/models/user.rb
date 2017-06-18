class User < ApplicationRecord
  # Initializes or updates user object when logging in with Facebook
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :recieved_conversations, class_name: 'Conversation', foreign_key: 'recipient_id'

  def self.from_omniauth(auth)
    where(fb_id: auth.uid).first_or_create do |user|
      user.oauth_provider = auth.provider
      user.fb_id = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.name ||= auth.info.name
      user.avatar_url ||= "http://graph.facebook.com/#{auth.uid}/picture?width=500"
      user.save!
    end
  end
end

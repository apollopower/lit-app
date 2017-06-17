class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth)
    where(fb_id: auth.uid).first_or_create do |user|
      user.oauth_provider = auth.provider
      user.fb_id = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at=Time.at(auth.credentials.expires_at)
      user.name ||=auth.info.name
      user.avatar_url ||="http://graph.facebook.com/#{auth.uid}/picture?width=500"
      user.save!
    end
  end
end

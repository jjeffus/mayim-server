class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist
  has_one_attached :avatar

  def self.online_users
    with_attached_avatar.where(:online => true)
  end

  Warden::Manager.after_set_user do |user, auth, opts|
    if (opts[:scope] == :user && opts[:event] == :set_user)
      user.online = true
      user.save!
    end
  end
end

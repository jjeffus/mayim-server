require 'devise/jwt'

class JwtBlacklist < ApplicationRecord
  include Devise::JWT
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_blacklist'
end

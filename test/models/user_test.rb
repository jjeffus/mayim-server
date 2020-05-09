require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def sign_in(user)
    post user_session_path \
      "user[email]"    => user.email,
      "user[password]" => user.password
  end
end

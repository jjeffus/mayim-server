require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest

  def setup
    @password = "password"
    @user = User.create(email: "#{rand(50000)}@example.com",
                                  password: @password)
  end

  test "successful login of user" do
    sign_in(user: @user, password: @password)
    assert_redirected_to home_url
  end

  test "unsuccessful login of user" do
    sign_in(user: @unuser, password: "wrong_"+@password)
    get home_path
    assert_response :redirect
  end

end

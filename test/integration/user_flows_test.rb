require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @user_params = {
      name: :new_user,
      login: :new_login,
      email: "new@email.com",
      password: :new_password
    }
  end

  test "new user" do
    get new_user_url
    assert_response :success

    post users_path, params: {user: @user_params}
    assert_response :redirect

    follow_redirect!
    assert_response :success
    assert_select ".user-name", @user_params[:name].to_s
  end

  #TODO test user interaction with other components
end

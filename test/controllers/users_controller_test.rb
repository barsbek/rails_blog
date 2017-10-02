require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:valid)
    @params = {
      name: 'new name',
      email: 'new@email.com',
      login: 'new login',
      password: 'new_password',
      password_confirmation: 'new_password'
    }
  end

  def create_user
    post users_url, params: {user: @params}
    User.last
  end

  def log_in
    post log_in_path, params: { 
      email: @user.email,
      password: :password # no way to extract it
    }
  end 

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: {user: @params}
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    log_in
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    log_in
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    log_in
    patch user_url(@user), params: { user: @params }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    log_in
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to root_url
  end
end

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @params = {
      name: 'new name',
      email: 'new@email.com',
      login: 'new login',
      password: 'new_password',
      password_confirmation: 'new_password'
    }
    @user = User.create(@params)
  end

  test "login page" do
    get log_in_path
    assert_response :success
  end

  test "user login" do
    post log_in_path, params: {email: @params[:email], password: @params[:password]}
    assert_redirected_to @user
  end

  test "incorrect password" do
    post log_in_path, params: {email: @params[:email], password: "incorrect"}
    assert_select "h1", text: "Log in"
  end

  test "incorrect email" do
    post log_in_path, params: {email: "incorrect", password: @params[:password]}
    assert_select "h1", text: "Log in"
  end
end

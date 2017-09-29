require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  def setup
    @params = {
      name: 'new name',
      email: 'new@email.com',
      login: 'new long',
      password: 'new password',
      password_confirmation: 'new password'
    }
    #TODO variable is duplicated - move into one place
  end

  test "creating a user" do
    visit new_user_url
    @params.each do |param, value|
      fill_in "user_#{param}", with: value
    end

    click_on "Create User"

    assert_text "Signed up!"
  end

  test "user log in" do
    assert User.create(@params)

    visit users_url
    click_on "log in"

    fill_in "email", with: @params[:email]
    fill_in "password", with: @params[:password]
    click_on "Log in"

    assert_text "Logged in as #{@params[:login]}"
  end
end

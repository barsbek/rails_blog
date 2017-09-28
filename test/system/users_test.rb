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
  end

  test "creating a user" do
    visit new_user_url
    @params.each do |param, value|
      fill_in "user_#{param}", with: value
    end

    click_on "Create User"

    assert_text "User was successfully created"
  end
end

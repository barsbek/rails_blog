require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @new_user = User.new(
      name: "new name",
      login: "new login",
      email: "new@email.com",
      password: "newpass"
    )
  end

  test "valid user" do
    assert @user.valid?
  end

  [:login, :name, :email, :password].each do |attr|
    test "invalidity without #{attr}" do
      @user[attr] = nil
      refute @user.valid?, "saved without #{attr}"
    end
  end

  [:login, :email].each do |attr|
    test "uniqueness of #{attr}" do
      @new_user[attr] = @user[attr]
      assert_not @new_user.valid?, "#{attr} is not unique"
    end
  end

  {password: 6, login: 2}.each do |attr, length|
    test "#{attr} length" do
      @user[attr] = 's'
      refute @user.valid?, "#{attr} of length < #{length}"
    end
  end

  test "email validity" do
    @user.valid?
    assert_empty @user.errors[:email]
  end
end

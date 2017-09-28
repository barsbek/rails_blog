require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @params = {
      name: 'new name',
      email: 'new@email.com',
      login: 'new long',
      password: 'new password'
    }
  end

  test "valid user" do
    assert @user.valid?
  end

  [:login, :name, :email, :password].each do |attr|
    test "invalidity without #{attr}" do
      @params[attr] = nil
      new_user = User.create(@params)
      refute_empty new_user.errors[attr], "saved without #{attr}"
    end
  end

  [:login, :email].each do |attr|
    test "uniqueness of #{attr}" do
      duplicate_user = @user.dup
      duplicate_user.valid?
      refute_empty duplicate_user.errors[attr], "#{attr} is not unique"
    end
  end

  {password: 6, login: 2}.each do |attr, length|
    test "#{attr} on invalid length" do
      @user[attr] = 's'
      @user.valid?
      refute_empty @user.errors[attr]
    end
  end

  test "on invalid email" do
    @user[:email] = "not_email"
    @user.valid?
    refute_empty @user.errors[:email], "saving invalid email"
  end
end

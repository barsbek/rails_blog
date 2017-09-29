require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @params = {
      name: 'new name',
      email: 'new@email.com',
      login: 'new long',
      password: 'new password',
      password_confirmation: 'new password'
    }
    @user = User.new(@params)
  end

  test "valid user" do
    assert @user.valid?
  end

  [:login, :name, :email, :password].each do |attr|
    test "invalidity without #{attr}" do
      @user.send("#{attr}=", nil)
      @user.save
      refute_empty @user.errors[attr], "saved without #{attr}"
    end
  end

  [:login, :email].each do |attr|
    test "uniqueness of #{attr}" do
      duplicate_user = users(:valid).dup
      duplicate_user.valid?
      refute_empty duplicate_user.errors[attr], "#{attr} is not unique"
    end
  end

  {password: 6, login: 2}.each do |attr, length|
    test "#{attr} on invalid length" do
      @user.send("#{attr}=", 's')
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

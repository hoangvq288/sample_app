require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new({name: "Hoang", email: "hoangvq288@gmail.com", password: "123456", password_confirmation: "123456"})
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name should not too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should not too long" do
    @user.email = "b" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "valid email address should be acceptable" do
    valid_addresses = %w[hoang@example.com HOANG@example.COM A_US-ER@foo.bar.org abc.xyz@gmail.com.vn abc+xyz@abc.com]
    valid_addresses.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "invalid email address should not be acceptable" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_add|
      @user.email = invalid_add
      assert_not @user.valid?, "#{invalid_add.inspect} should be valid" 
    end
  end

  test "email should be valid" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

  test "email should be lower case before save" do
    email_mixed = "ABcd@GMAIL.com"
    @user.email = email_mixed
    @user.save
    assert_equal email_mixed.downcase, @user.reload.email
  end

  test "password should be present (noblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end

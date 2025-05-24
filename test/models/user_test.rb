require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @valid_attributes = {
      username: "uniqueuser",
      full_name: "Unique User",
      email: "unique@example.com",
      password: "password",
      created_on: Date.today
    }
  end

  test "should not save user without username" do
    user = User.new(@valid_attributes.except(:username))
    assert_not user.save, "Saved the user without a username"
  end

  test "should not save user without full_name" do
    user = User.new(@valid_attributes.except(:full_name))
    assert_not user.save, "Saved the user without a full_name"
  end

  test "should not save user without email" do
    user = User.new(@valid_attributes.except(:email))
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without password" do
    user = User.new(@valid_attributes.except(:password))
    assert_not user.save, "Saved the user without a password"
  end

  test "should not save user with non-unique username" do
    User.create!(@valid_attributes)
    user = User.new(@valid_attributes.merge(email: "other@example.com"))
    assert_not user.save, "Saved the user with a duplicate username"
  end

  test "should not save user with non-unique email" do
    User.create!(@valid_attributes)
    user = User.new(@valid_attributes.merge(username: "otheruser"))
    assert_not user.save, "Saved the user with a duplicate email"
  end

  test "should save valid user" do
    user = User.new(@valid_attributes)
    assert user.save, "Could not save a valid user"
  end
end

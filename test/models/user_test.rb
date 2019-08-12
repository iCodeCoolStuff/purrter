require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "memestar", username: "memer29", email: "meme@meme.com", 
                        password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be no longer than 15 characters" do
    @user.username = "a" * 16
    assert_not @user.valid?
    @user.username = "b" * 15
    assert @user.valid?
  end

  test "username should have no special characters" do
    @user.username = "!@#$%^&*()-+"
    assert_not @user.valid?
  end
end

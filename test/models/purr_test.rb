require 'test_helper'

class PurrTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "abcd", username: "efgh", email: "afkdjakfjkdlas@example.com", password: "foobar", password_confirmation: "foobar")
    @purr = @user.purrs.build(content: "This is some sample text.")
  end

  test "should be valid" do
    assert @purr.valid?
  end

  test "content should be no longer than 140 characters" do
    @purr.content = "a" * 141
    assert_not @purr.valid?
    @purr.content = "b" * 140
    assert @purr.valid?
  end
end

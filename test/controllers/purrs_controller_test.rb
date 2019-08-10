require 'test_helper'

class PurrsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purr = purrs(:one)
  end

  test "should get index" do
    get purrs_url
    assert_response :success
  end

  test "should get new" do
    get new_purr_url
    assert_response :success
  end

  test "should create purr" do
    assert_difference('Purr.count') do
      post purrs_url, params: { purr: { content: @purr.content, user_id: @purr.user_id } }
    end

    assert_redirected_to purr_url(Purr.last)
  end

  test "should show purr" do
    get purr_url(@purr)
    assert_response :success
  end

  test "should get edit" do
    get edit_purr_url(@purr)
    assert_response :success
  end

  test "should update purr" do
    patch purr_url(@purr), params: { purr: { content: @purr.content, user_id: @purr.user_id } }
    assert_redirected_to purr_url(@purr)
  end

  test "should destroy purr" do
    assert_difference('Purr.count', -1) do
      delete purr_url(@purr)
    end

    assert_redirected_to purrs_url
  end
end

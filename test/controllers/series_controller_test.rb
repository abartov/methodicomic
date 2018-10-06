require 'test_helper'

class SeriesControllerTest < ActionController::TestCase
  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get follow" do
    get :follow
    assert_response :success
  end

  test "should get unfollow" do
    get :unfollow
    assert_response :success
  end

end

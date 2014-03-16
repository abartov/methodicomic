require 'test_helper'

class IssuesControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

  test "should get read" do
    get :read
    assert_response :success
  end

  test "should get unread" do
    get :unread
    assert_response :success
  end

end

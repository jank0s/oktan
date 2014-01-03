require 'test_helper'

class CarControllerTest < ActionController::TestCase
  test "should get info" do
    get :info
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end

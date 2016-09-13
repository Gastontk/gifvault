require 'test_helper'

class GifControllerTest < ActionController::TestCase
  test "should get cool" do
    get :cool
    assert_response :success
  end

  test "should get free" do
    get :free
    assert_response :success
  end

end

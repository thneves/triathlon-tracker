require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get triathlon_tracker" do
    get pages_triathlon_tracker_url
    assert_response :success
  end
end

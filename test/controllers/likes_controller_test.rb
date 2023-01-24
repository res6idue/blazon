require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get likes_show_url
    assert_response :success
  end

  test "should get create" do
    get blazo_like_url
    assert_response :success
  end

  test "should get delete" do
    get likes_delete_url
    assert_response :success
  end
end

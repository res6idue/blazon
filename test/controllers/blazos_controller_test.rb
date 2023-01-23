require "test_helper"

class BlazosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blazo = blazos(:one)
  end

  test "should get index" do
    get blazos_url
    assert_response :success
  end

  test "should get new" do
    get new_blazo_url
    assert_response :success
  end

  test "should create blazo" do
    assert_difference("Blazo.count") do
      post blazos_url, params: { blazo: { abstract: @blazo.abstract, content: @blazo.content, user_id: @blazo.user_id } }
    end

    assert_redirected_to blazo_url(Blazo.last)
  end

  test "should show blazo" do
    get blazo_url(@blazo)
    assert_response :success
  end

  test "should get edit" do
    get edit_blazo_url(@blazo)
    assert_response :success
  end

  test "should update blazo" do
    patch blazo_url(@blazo), params: { blazo: { abstract: @blazo.abstract, content: @blazo.content, user_id: @blazo.user_id } }
    assert_redirected_to blazo_url(@blazo)
  end

  test "should destroy blazo" do
    assert_difference("Blazo.count", -1) do
      delete blazo_url(@blazo)
    end

    assert_redirected_to blazos_url
  end
end

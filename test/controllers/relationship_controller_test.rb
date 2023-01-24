require "test_helper"

class RelationshipControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get relationship_show_url
    assert_response :success
  end

  test "should get create" do
    get relationship_create_url
    assert_response :success
  end

  test "should get delete" do
    get relationship_delete_url
    assert_response :success
  end
end

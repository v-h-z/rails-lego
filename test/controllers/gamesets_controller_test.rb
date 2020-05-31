require 'test_helper'

class GamesetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gamesets_index_url
    assert_response :success
  end

  test "should get show" do
    get gamesets_show_url
    assert_response :success
  end

  test "should get new" do
    get gamesets_new_url
    assert_response :success
  end

  test "should get create" do
    get gamesets_create_url
    assert_response :success
  end

end

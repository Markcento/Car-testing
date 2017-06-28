require 'test_helper'

class CargameControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cargame_index_url
    assert_response :success
  end

  test "should get register" do
    get cargame_register_url
    assert_response :success
  end

  test "should get play" do
    get cargame_play_url
    assert_response :success
  end

end

require 'test_helper'

class ImgsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get imgs_edit_url
    assert_response :success
  end

  test "should get index" do
    get imgs_index_url
    assert_response :success
  end

  test "should get new" do
    get imgs_new_url
    assert_response :success
  end

  test "should get show" do
    get imgs_show_url
    assert_response :success
  end

end

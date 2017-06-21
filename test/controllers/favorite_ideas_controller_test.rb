require 'test_helper'

class FavoriteIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorite_ideas_index_url
    assert_response :success
  end

  test "should get create" do
    get favorite_ideas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favorite_ideas_destroy_url
    assert_response :success
  end

end

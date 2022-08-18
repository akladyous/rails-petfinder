require "test_helper"

class Listings::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listings_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get listings_posts_show_url
    assert_response :success
  end

  test "should get create" do
    get listings_posts_create_url
    assert_response :success
  end
end

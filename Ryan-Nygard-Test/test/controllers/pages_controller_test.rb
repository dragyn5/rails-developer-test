require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should not allow guest users to create article" do
    get new_article_url
    assert_response :redirect
  end

end

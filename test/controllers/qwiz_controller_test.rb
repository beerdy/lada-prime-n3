require 'test_helper'

class QwizControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get qwiz_index_url
    assert_response :success
  end

end

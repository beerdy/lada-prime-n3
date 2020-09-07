require 'test_helper'

class Tradein::MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tradein_main_index_url
    assert_response :success
  end

end

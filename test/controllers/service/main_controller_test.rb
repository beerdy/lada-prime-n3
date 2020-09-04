require 'test_helper'

class Service::MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_main_index_url
    assert_response :success
  end

end

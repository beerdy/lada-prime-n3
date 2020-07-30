require 'test_helper'

class ModificationImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get modification_images_show_url
    assert_response :success
  end

end

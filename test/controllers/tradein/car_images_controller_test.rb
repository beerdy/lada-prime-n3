require 'test_helper'

class Tradein::CarImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tradein_car_image = tradein_car_images(:one)
  end

  test "should get index" do
    get tradein_car_images_url
    assert_response :success
  end

  test "should get new" do
    get new_tradein_car_image_url
    assert_response :success
  end

  test "should create tradein_car_image" do
    assert_difference('Tradein::CarImage.count') do
      post tradein_car_images_url, params: { tradein_car_image: { tradein_car_id: @tradein_car_image.tradein_car_id } }
    end

    assert_redirected_to tradein_car_image_url(Tradein::CarImage.last)
  end

  test "should show tradein_car_image" do
    get tradein_car_image_url(@tradein_car_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_tradein_car_image_url(@tradein_car_image)
    assert_response :success
  end

  test "should update tradein_car_image" do
    patch tradein_car_image_url(@tradein_car_image), params: { tradein_car_image: { tradein_car_id: @tradein_car_image.tradein_car_id } }
    assert_redirected_to tradein_car_image_url(@tradein_car_image)
  end

  test "should destroy tradein_car_image" do
    assert_difference('Tradein::CarImage.count', -1) do
      delete tradein_car_image_url(@tradein_car_image)
    end

    assert_redirected_to tradein_car_images_url
  end
end

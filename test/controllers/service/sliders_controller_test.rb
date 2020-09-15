require 'test_helper'

class Service::SlidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_slider = service_sliders(:one)
  end

  test "should get index" do
    get service_sliders_url
    assert_response :success
  end

  test "should get new" do
    get new_service_slider_url
    assert_response :success
  end

  test "should create service_slider" do
    assert_difference('Service::Slider.count') do
      post service_sliders_url, params: { service_slider: { description: @service_slider.description, link: @service_slider.link, show: @service_slider.show, slave: @service_slider.slave, sort: @service_slider.sort, title: @service_slider.title, url: @service_slider.url } }
    end

    assert_redirected_to service_slider_url(Service::Slider.last)
  end

  test "should show service_slider" do
    get service_slider_url(@service_slider)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_slider_url(@service_slider)
    assert_response :success
  end

  test "should update service_slider" do
    patch service_slider_url(@service_slider), params: { service_slider: { description: @service_slider.description, link: @service_slider.link, show: @service_slider.show, slave: @service_slider.slave, sort: @service_slider.sort, title: @service_slider.title, url: @service_slider.url } }
    assert_redirected_to service_slider_url(@service_slider)
  end

  test "should destroy service_slider" do
    assert_difference('Service::Slider.count', -1) do
      delete service_slider_url(@service_slider)
    end

    assert_redirected_to service_sliders_url
  end
end

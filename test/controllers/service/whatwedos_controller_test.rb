require 'test_helper'

class Service::WhatwedosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_whatwedo = service_whatwedos(:one)
  end

  test "should get index" do
    get service_whatwedos_url
    assert_response :success
  end

  test "should get new" do
    get new_service_whatwedo_url
    assert_response :success
  end

  test "should create service_whatwedo" do
    assert_difference('Service::Whatwedo.count') do
      post service_whatwedos_url, params: { service_whatwedo: { description: @service_whatwedo.description, link: @service_whatwedo.link, show: @service_whatwedo.show, slave: @service_whatwedo.slave, sort: @service_whatwedo.sort, title: @service_whatwedo.title, url: @service_whatwedo.url } }
    end

    assert_redirected_to service_whatwedo_url(Service::Whatwedo.last)
  end

  test "should show service_whatwedo" do
    get service_whatwedo_url(@service_whatwedo)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_whatwedo_url(@service_whatwedo)
    assert_response :success
  end

  test "should update service_whatwedo" do
    patch service_whatwedo_url(@service_whatwedo), params: { service_whatwedo: { description: @service_whatwedo.description, link: @service_whatwedo.link, show: @service_whatwedo.show, slave: @service_whatwedo.slave, sort: @service_whatwedo.sort, title: @service_whatwedo.title, url: @service_whatwedo.url } }
    assert_redirected_to service_whatwedo_url(@service_whatwedo)
  end

  test "should destroy service_whatwedo" do
    assert_difference('Service::Whatwedo.count', -1) do
      delete service_whatwedo_url(@service_whatwedo)
    end

    assert_redirected_to service_whatwedos_url
  end
end

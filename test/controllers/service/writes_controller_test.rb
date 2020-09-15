require 'test_helper'

class Service::WritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_write = service_writes(:one)
  end

  test "should get index" do
    get service_writes_url
    assert_response :success
  end

  test "should get new" do
    get new_service_write_url
    assert_response :success
  end

  test "should create service_write" do
    assert_difference('Service::Write.count') do
      post service_writes_url, params: { service_write: { link: @service_write.link, mileage: @service_write.mileage, model: @service_write.model, name: @service_write.name, phone: @service_write.phone, show: @service_write.show, sort: @service_write.sort, url: @service_write.url, work: @service_write.work, year: @service_write.year } }
    end

    assert_redirected_to service_write_url(Service::Write.last)
  end

  test "should show service_write" do
    get service_write_url(@service_write)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_write_url(@service_write)
    assert_response :success
  end

  test "should update service_write" do
    patch service_write_url(@service_write), params: { service_write: { link: @service_write.link, mileage: @service_write.mileage, model: @service_write.model, name: @service_write.name, phone: @service_write.phone, show: @service_write.show, sort: @service_write.sort, url: @service_write.url, work: @service_write.work, year: @service_write.year } }
    assert_redirected_to service_write_url(@service_write)
  end

  test "should destroy service_write" do
    assert_difference('Service::Write.count', -1) do
      delete service_write_url(@service_write)
    end

    assert_redirected_to service_writes_url
  end
end

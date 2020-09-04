require 'test_helper'

class Service::WorksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_work = service_works(:one)
  end

  test "should get index" do
    get service_works_url
    assert_response :success
  end

  test "should get new" do
    get new_service_work_url
    assert_response :success
  end

  test "should create service_work" do
    assert_difference('Service::Work.count') do
      post service_works_url, params: { service_work: { description: @service_work.description, link: @service_work.link, show: @service_work.show, slave: @service_work.slave, sort: @service_work.sort, title: @service_work.title, url: @service_work.url } }
    end

    assert_redirected_to service_work_url(Service::Work.last)
  end

  test "should show service_work" do
    get service_work_url(@service_work)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_work_url(@service_work)
    assert_response :success
  end

  test "should update service_work" do
    patch service_work_url(@service_work), params: { service_work: { description: @service_work.description, link: @service_work.link, show: @service_work.show, slave: @service_work.slave, sort: @service_work.sort, title: @service_work.title, url: @service_work.url } }
    assert_redirected_to service_work_url(@service_work)
  end

  test "should destroy service_work" do
    assert_difference('Service::Work.count', -1) do
      delete service_work_url(@service_work)
    end

    assert_redirected_to service_works_url
  end
end

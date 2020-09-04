require 'test_helper'

class Service::SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_sale = service_sales(:one)
  end

  test "should get index" do
    get service_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_service_sale_url
    assert_response :success
  end

  test "should create service_sale" do
    assert_difference('Service::Sale.count') do
      post service_sales_url, params: { service_sale: { description: @service_sale.description, link: @service_sale.link, show: @service_sale.show, slave: @service_sale.slave, sort: @service_sale.sort, title: @service_sale.title, url: @service_sale.url } }
    end

    assert_redirected_to service_sale_url(Service::Sale.last)
  end

  test "should show service_sale" do
    get service_sale_url(@service_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_sale_url(@service_sale)
    assert_response :success
  end

  test "should update service_sale" do
    patch service_sale_url(@service_sale), params: { service_sale: { description: @service_sale.description, link: @service_sale.link, show: @service_sale.show, slave: @service_sale.slave, sort: @service_sale.sort, title: @service_sale.title, url: @service_sale.url } }
    assert_redirected_to service_sale_url(@service_sale)
  end

  test "should destroy service_sale" do
    assert_difference('Service::Sale.count', -1) do
      delete service_sale_url(@service_sale)
    end

    assert_redirected_to service_sales_url
  end
end

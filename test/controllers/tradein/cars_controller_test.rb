require 'test_helper'

class Tradein::CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tradein_car = tradein_cars(:one)
  end

  test "should get index" do
    get tradein_cars_url
    assert_response :success
  end

  test "should get new" do
    get new_tradein_car_url
    assert_response :success
  end

  test "should create tradein_car" do
    assert_difference('Tradein::Car.count') do
      post tradein_cars_url, params: { tradein_car: {  } }
    end

    assert_redirected_to tradein_car_url(Tradein::Car.last)
  end

  test "should show tradein_car" do
    get tradein_car_url(@tradein_car)
    assert_response :success
  end

  test "should get edit" do
    get edit_tradein_car_url(@tradein_car)
    assert_response :success
  end

  test "should update tradein_car" do
    patch tradein_car_url(@tradein_car), params: { tradein_car: {  } }
    assert_redirected_to tradein_car_url(@tradein_car)
  end

  test "should destroy tradein_car" do
    assert_difference('Tradein::Car.count', -1) do
      delete tradein_car_url(@tradein_car)
    end

    assert_redirected_to tradein_cars_url
  end
end

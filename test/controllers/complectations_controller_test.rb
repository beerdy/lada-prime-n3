require 'test_helper'

class ComplectationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complectation = complectations(:one)
  end

  test "should get index" do
    get complectations_url
    assert_response :success
  end

  test "should get new" do
    get new_complectation_url
    assert_response :success
  end

  test "should create complectation" do
    assert_difference('Complectation.count') do
      post complectations_url, params: { complectation: { case: @complectation.case, clapan: @complectation.clapan, color: @complectation.color, condition: @complectation.condition, description: @complectation.description, drive: @complectation.drive, engine: @complectation.engine, link: @complectation.link, millage: @complectation.millage, owners: @complectation.owners, power: @complectation.power, price_new: @complectation.price_new, price_old: @complectation.price_old, show: @complectation.show, sort: @complectation.sort, title: @complectation.title, transmission: @complectation.transmission, type: @complectation.type, url: @complectation.url, year: @complectation.year } }
    end

    assert_redirected_to complectation_url(Complectation.last)
  end

  test "should show complectation" do
    get complectation_url(@complectation)
    assert_response :success
  end

  test "should get edit" do
    get edit_complectation_url(@complectation)
    assert_response :success
  end

  test "should update complectation" do
    patch complectation_url(@complectation), params: { complectation: { case: @complectation.case, clapan: @complectation.clapan, color: @complectation.color, condition: @complectation.condition, description: @complectation.description, drive: @complectation.drive, engine: @complectation.engine, link: @complectation.link, millage: @complectation.millage, owners: @complectation.owners, power: @complectation.power, price_new: @complectation.price_new, price_old: @complectation.price_old, show: @complectation.show, sort: @complectation.sort, title: @complectation.title, transmission: @complectation.transmission, type: @complectation.type, url: @complectation.url, year: @complectation.year } }
    assert_redirected_to complectation_url(@complectation)
  end

  test "should destroy complectation" do
    assert_difference('Complectation.count', -1) do
      delete complectation_url(@complectation)
    end

    assert_redirected_to complectations_url
  end
end

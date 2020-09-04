require 'test_helper'

class Service::ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @service_review = service_reviews(:one)
  end

  test "should get index" do
    get service_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_service_review_url
    assert_response :success
  end

  test "should create service_review" do
    assert_difference('Service::Review.count') do
      post service_reviews_url, params: { service_review: { description: @service_review.description, link: @service_review.link, show: @service_review.show, slave: @service_review.slave, sort: @service_review.sort, title: @service_review.title, url: @service_review.url } }
    end

    assert_redirected_to service_review_url(Service::Review.last)
  end

  test "should show service_review" do
    get service_review_url(@service_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_review_url(@service_review)
    assert_response :success
  end

  test "should update service_review" do
    patch service_review_url(@service_review), params: { service_review: { description: @service_review.description, link: @service_review.link, show: @service_review.show, slave: @service_review.slave, sort: @service_review.sort, title: @service_review.title, url: @service_review.url } }
    assert_redirected_to service_review_url(@service_review)
  end

  test "should destroy service_review" do
    assert_difference('Service::Review.count', -1) do
      delete service_review_url(@service_review)
    end

    assert_redirected_to service_reviews_url
  end
end

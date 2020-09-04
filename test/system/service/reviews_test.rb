require "application_system_test_case"

class Service::ReviewsTest < ApplicationSystemTestCase
  setup do
    @service_review = service_reviews(:one)
  end

  test "visiting the index" do
    visit service_reviews_url
    assert_selector "h1", text: "Service/Reviews"
  end

  test "creating a Review" do
    visit service_reviews_url
    click_on "New Service/Review"

    fill_in "Description", with: @service_review.description
    fill_in "Link", with: @service_review.link
    check "Show" if @service_review.show
    fill_in "Slave", with: @service_review.slave
    fill_in "Sort", with: @service_review.sort
    fill_in "Title", with: @service_review.title
    fill_in "Url", with: @service_review.url
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit service_reviews_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_review.description
    fill_in "Link", with: @service_review.link
    check "Show" if @service_review.show
    fill_in "Slave", with: @service_review.slave
    fill_in "Sort", with: @service_review.sort
    fill_in "Title", with: @service_review.title
    fill_in "Url", with: @service_review.url
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit service_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end

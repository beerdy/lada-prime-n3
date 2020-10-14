require "application_system_test_case"

class Tradein::CarImagesTest < ApplicationSystemTestCase
  setup do
    @tradein_car_image = tradein_car_images(:one)
  end

  test "visiting the index" do
    visit tradein_car_images_url
    assert_selector "h1", text: "Tradein/Car Images"
  end

  test "creating a Car image" do
    visit tradein_car_images_url
    click_on "New Tradein/Car Image"

    fill_in "Tradein car", with: @tradein_car_image.tradein_car_id
    click_on "Create Car image"

    assert_text "Car image was successfully created"
    click_on "Back"
  end

  test "updating a Car image" do
    visit tradein_car_images_url
    click_on "Edit", match: :first

    fill_in "Tradein car", with: @tradein_car_image.tradein_car_id
    click_on "Update Car image"

    assert_text "Car image was successfully updated"
    click_on "Back"
  end

  test "destroying a Car image" do
    visit tradein_car_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Car image was successfully destroyed"
  end
end

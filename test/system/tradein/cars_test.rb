require "application_system_test_case"

class Tradein::CarsTest < ApplicationSystemTestCase
  setup do
    @tradein_car = tradein_cars(:one)
  end

  test "visiting the index" do
    visit tradein_cars_url
    assert_selector "h1", text: "Tradein/Cars"
  end

  test "creating a Car" do
    visit tradein_cars_url
    click_on "New Tradein/Car"

    click_on "Create Car"

    assert_text "Car was successfully created"
    click_on "Back"
  end

  test "updating a Car" do
    visit tradein_cars_url
    click_on "Edit", match: :first

    click_on "Update Car"

    assert_text "Car was successfully updated"
    click_on "Back"
  end

  test "destroying a Car" do
    visit tradein_cars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Car was successfully destroyed"
  end
end

require "application_system_test_case"

class Service::SlidersTest < ApplicationSystemTestCase
  setup do
    @service_slider = service_sliders(:one)
  end

  test "visiting the index" do
    visit service_sliders_url
    assert_selector "h1", text: "Service/Sliders"
  end

  test "creating a Slider" do
    visit service_sliders_url
    click_on "New Service/Slider"

    fill_in "Description", with: @service_slider.description
    fill_in "Link", with: @service_slider.link
    check "Show" if @service_slider.show
    fill_in "Slave", with: @service_slider.slave
    fill_in "Sort", with: @service_slider.sort
    fill_in "Title", with: @service_slider.title
    fill_in "Url", with: @service_slider.url
    click_on "Create Slider"

    assert_text "Slider was successfully created"
    click_on "Back"
  end

  test "updating a Slider" do
    visit service_sliders_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_slider.description
    fill_in "Link", with: @service_slider.link
    check "Show" if @service_slider.show
    fill_in "Slave", with: @service_slider.slave
    fill_in "Sort", with: @service_slider.sort
    fill_in "Title", with: @service_slider.title
    fill_in "Url", with: @service_slider.url
    click_on "Update Slider"

    assert_text "Slider was successfully updated"
    click_on "Back"
  end

  test "destroying a Slider" do
    visit service_sliders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slider was successfully destroyed"
  end
end

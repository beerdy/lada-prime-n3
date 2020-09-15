require "application_system_test_case"

class Service::WritesTest < ApplicationSystemTestCase
  setup do
    @service_write = service_writes(:one)
  end

  test "visiting the index" do
    visit service_writes_url
    assert_selector "h1", text: "Service/Writes"
  end

  test "creating a Write" do
    visit service_writes_url
    click_on "New Service/Write"

    fill_in "Link", with: @service_write.link
    fill_in "Mileage", with: @service_write.mileage
    fill_in "Model", with: @service_write.model
    fill_in "Name", with: @service_write.name
    fill_in "Phone", with: @service_write.phone
    check "Show" if @service_write.show
    fill_in "Sort", with: @service_write.sort
    fill_in "Url", with: @service_write.url
    fill_in "Work", with: @service_write.work
    fill_in "Year", with: @service_write.year
    click_on "Create Write"

    assert_text "Write was successfully created"
    click_on "Back"
  end

  test "updating a Write" do
    visit service_writes_url
    click_on "Edit", match: :first

    fill_in "Link", with: @service_write.link
    fill_in "Mileage", with: @service_write.mileage
    fill_in "Model", with: @service_write.model
    fill_in "Name", with: @service_write.name
    fill_in "Phone", with: @service_write.phone
    check "Show" if @service_write.show
    fill_in "Sort", with: @service_write.sort
    fill_in "Url", with: @service_write.url
    fill_in "Work", with: @service_write.work
    fill_in "Year", with: @service_write.year
    click_on "Update Write"

    assert_text "Write was successfully updated"
    click_on "Back"
  end

  test "destroying a Write" do
    visit service_writes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Write was successfully destroyed"
  end
end

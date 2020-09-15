require "application_system_test_case"

class Service::WhatwedosTest < ApplicationSystemTestCase
  setup do
    @service_whatwedo = service_whatwedos(:one)
  end

  test "visiting the index" do
    visit service_whatwedos_url
    assert_selector "h1", text: "Service/Whatwedos"
  end

  test "creating a Whatwedo" do
    visit service_whatwedos_url
    click_on "New Service/Whatwedo"

    fill_in "Description", with: @service_whatwedo.description
    fill_in "Link", with: @service_whatwedo.link
    check "Show" if @service_whatwedo.show
    fill_in "Slave", with: @service_whatwedo.slave
    fill_in "Sort", with: @service_whatwedo.sort
    fill_in "Title", with: @service_whatwedo.title
    fill_in "Url", with: @service_whatwedo.url
    click_on "Create Whatwedo"

    assert_text "Whatwedo was successfully created"
    click_on "Back"
  end

  test "updating a Whatwedo" do
    visit service_whatwedos_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_whatwedo.description
    fill_in "Link", with: @service_whatwedo.link
    check "Show" if @service_whatwedo.show
    fill_in "Slave", with: @service_whatwedo.slave
    fill_in "Sort", with: @service_whatwedo.sort
    fill_in "Title", with: @service_whatwedo.title
    fill_in "Url", with: @service_whatwedo.url
    click_on "Update Whatwedo"

    assert_text "Whatwedo was successfully updated"
    click_on "Back"
  end

  test "destroying a Whatwedo" do
    visit service_whatwedos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Whatwedo was successfully destroyed"
  end
end

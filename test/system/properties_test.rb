require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Comfort", with: @property.comfort
    fill_in "Extarier", with: @property.extarier
    fill_in "Interier", with: @property.interier
    fill_in "Link", with: @property.link
    fill_in "Secure", with: @property.secure
    check "Show" if @property.show
    fill_in "Sort", with: @property.sort
    fill_in "Url", with: @property.url
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Comfort", with: @property.comfort
    fill_in "Extarier", with: @property.extarier
    fill_in "Interier", with: @property.interier
    fill_in "Link", with: @property.link
    fill_in "Secure", with: @property.secure
    check "Show" if @property.show
    fill_in "Sort", with: @property.sort
    fill_in "Url", with: @property.url
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "destroying a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property was successfully destroyed"
  end
end

require "application_system_test_case"

class SpecialsTest < ApplicationSystemTestCase
  setup do
    @special = specials(:one)
  end

  test "visiting the index" do
    visit specials_url
    assert_selector "h1", text: "Specials"
  end

  test "creating a Special" do
    visit specials_url
    click_on "New Special"

    fill_in "Description", with: @special.description
    fill_in "Link", with: @special.link
    check "Show" if @special.show
    fill_in "Slave", with: @special.slave
    fill_in "Sort", with: @special.sort
    fill_in "Title", with: @special.title
    fill_in "Url", with: @special.url
    click_on "Create Special"

    assert_text "Special was successfully created"
    click_on "Back"
  end

  test "updating a Special" do
    visit specials_url
    click_on "Edit", match: :first

    fill_in "Description", with: @special.description
    fill_in "Link", with: @special.link
    check "Show" if @special.show
    fill_in "Slave", with: @special.slave
    fill_in "Sort", with: @special.sort
    fill_in "Title", with: @special.title
    fill_in "Url", with: @special.url
    click_on "Update Special"

    assert_text "Special was successfully updated"
    click_on "Back"
  end

  test "destroying a Special" do
    visit specials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Special was successfully destroyed"
  end
end

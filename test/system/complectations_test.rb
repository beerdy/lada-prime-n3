require "application_system_test_case"

class ComplectationsTest < ApplicationSystemTestCase
  setup do
    @complectation = complectations(:one)
  end

  test "visiting the index" do
    visit complectations_url
    assert_selector "h1", text: "Complectations"
  end

  test "creating a Complectation" do
    visit complectations_url
    click_on "New Complectation"

    fill_in "Case", with: @complectation.case
    fill_in "Clapan", with: @complectation.clapan
    fill_in "Color", with: @complectation.color
    fill_in "Condition", with: @complectation.condition
    fill_in "Description", with: @complectation.description
    fill_in "Drive", with: @complectation.drive
    fill_in "Engine", with: @complectation.engine
    fill_in "Link", with: @complectation.link
    fill_in "Millage", with: @complectation.millage
    fill_in "Owners", with: @complectation.owners
    fill_in "Power", with: @complectation.power
    fill_in "Price new", with: @complectation.price_new
    fill_in "Price old", with: @complectation.price_old
    check "Show" if @complectation.show
    fill_in "Sort", with: @complectation.sort
    fill_in "Title", with: @complectation.title
    fill_in "Transmission", with: @complectation.transmission
    fill_in "Type", with: @complectation.type
    fill_in "Url", with: @complectation.url
    fill_in "Year", with: @complectation.year
    click_on "Create Complectation"

    assert_text "Complectation was successfully created"
    click_on "Back"
  end

  test "updating a Complectation" do
    visit complectations_url
    click_on "Edit", match: :first

    fill_in "Case", with: @complectation.case
    fill_in "Clapan", with: @complectation.clapan
    fill_in "Color", with: @complectation.color
    fill_in "Condition", with: @complectation.condition
    fill_in "Description", with: @complectation.description
    fill_in "Drive", with: @complectation.drive
    fill_in "Engine", with: @complectation.engine
    fill_in "Link", with: @complectation.link
    fill_in "Millage", with: @complectation.millage
    fill_in "Owners", with: @complectation.owners
    fill_in "Power", with: @complectation.power
    fill_in "Price new", with: @complectation.price_new
    fill_in "Price old", with: @complectation.price_old
    check "Show" if @complectation.show
    fill_in "Sort", with: @complectation.sort
    fill_in "Title", with: @complectation.title
    fill_in "Transmission", with: @complectation.transmission
    fill_in "Type", with: @complectation.type
    fill_in "Url", with: @complectation.url
    fill_in "Year", with: @complectation.year
    click_on "Update Complectation"

    assert_text "Complectation was successfully updated"
    click_on "Back"
  end

  test "destroying a Complectation" do
    visit complectations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Complectation was successfully destroyed"
  end
end
